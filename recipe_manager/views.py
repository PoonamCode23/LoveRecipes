from django.shortcuts import render
from django.core.paginator import Paginator
from django.shortcuts import render, redirect, get_object_or_404
from .forms import RecipeForm
from django.contrib import messages
from .models import Recipe
from django.conf import settings  # for deleting image file
import os  # deleting media folder
from save_recipe.models import Favorite
from ratings_reviews.models import Review
from ratings_reviews.models import Like
from django.db.models import Avg, Count
from django.db.models.functions import Round
from django.contrib.auth.decorators import login_required
import json
import sweetify


@login_required
def upload_recipe(request):
    title = 'LoveRecipes: Add Your Delicious Recipe'
    subtitle = 'Adding your personal recipes is easy. Add yours to your favorites, share with friends, family, or the LoveRecipes community.'
    submit_button_text = 'Submit Recipe'
    if request.method == 'POST':
        form = RecipeForm(request.POST, request.FILES)
        if form.is_valid():
            ingredients = form.cleaned_data['ingredients']
            directions = form.cleaned_data['directions']
            tags = form.cleaned_data['tags']

            # Capitalize the first character of each tag
            tags = [tag.capitalize() for tag in tags]

            recipe = form.save(commit=False)
            recipe.user = request.user  # Assign the logged-in user to the recipe
            recipe.set_ingredients(ingredients)
            recipe.set_directions(directions)
            recipe.set_tags(tags)
            recipe.save()
            sweetify.success(
                request, "Wow! You've created a delicious new recipe. 🍓", timer=3000)
            return redirect('http://127.0.0.1:8000/')

        else:
            print("Form errors:", form.errors)
    else:
        form = RecipeForm()
    context = {
        'form': form,
        'title': title,
        'subtitle': subtitle,
        'submit_button_text': submit_button_text,
        'recipe': None,
    }
    return render(request, 'recipe_form.html', context)


def update_recipe(request, recipe_id):
    title = 'LoveRecipes: Edit recipe'
    subtitle = 'Edit details of your recipe below.'
    submit_button_text = 'Update Recipe'
    recipe = get_object_or_404(Recipe, id=recipe_id)

    if request.method == 'POST':
        form = RecipeForm(request.POST, request.FILES, instance=recipe)
        if form.is_valid():
            ingredients = form.cleaned_data['ingredients']
            directions = form.cleaned_data['directions']
            tags = form.cleaned_data['tags']

            recipe = form.save(commit=False)
            recipe.set_ingredients(ingredients)
            recipe.set_directions(directions)
            recipe.set_tags(tags)
            recipe.save()

            sweetify.success(
                request, 'All set! Your recipe has been successfully updated.', timer=3000)

            return redirect('recipe_manager:recipe_details', recipe_id=recipe.id)
        else:
            print("Form errors:", form.errors)
    else:
        form = RecipeForm(instance=recipe)

    context = {
        'form': form,
        'title': title,
        'subtitle': subtitle,
        'submit_button_text': submit_button_text,
        'recipe': recipe,
    }

    return render(request, 'recipe_form.html', context)


def view_recipes(request):
    title = 'LoveRecipes'
    user = request.user

    latest_recipes = Recipe.objects.order_by('-created_at')[:6]

    recipes = Recipe.objects.order_by('created_at')

    top_rated_recipes = Recipe.objects.annotate(
        review_count=Count('review'),
        average_rating=Avg('review__ratings')
    ).filter(average_rating__gt=3).order_by('-average_rating')[:4]

    message = ""

    tag = request.GET.get('tag')
    if tag:
        recipes = Recipe.objects.filter(tags__icontains=tag).order_by('?')
        message = f"Explore '{tag.upper()}' Recipes"

        # Don't show latest recipes if a tag is present
        latest_recipes = []

    # average rating and review count for each recipe
    for recipe in recipes:
        # function from django.db.models.functions is designed for use within database queries, not directly on Python variables
        average_rating = recipe.review_set.aggregate(
            rounded_avg=Round(Avg('ratings')))['rounded_avg']
        review_count = recipe.review_set.count()

        # recipe obj sud have attributes like average_rating and review_count to be displayed in template

        recipe.average_rating = average_rating
        recipe.review_count = review_count

    # Paginate the recipes
    paginator = Paginator(recipes, 8)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    recipe_list = []
    for recipe in page_obj:
        recipe_data = {
            'id': recipe.id,
            'image': recipe.image,
            'title': recipe.title,
            'description': recipe.description,
            'tags': json.loads(recipe.tags),
            'user': recipe.user.username if recipe.user.is_authenticated else 'Anonymous',
            'user_id': recipe.user.id if recipe.user.is_authenticated else None,
            'is_favorite': False,
            'average_rating': recipe.average_rating,
            'review_count': recipe.review_count,

        }
        if user.is_authenticated:
            recipe_data['is_favorite'] = Favorite.objects.filter(
                user=user, recipe=recipe).exists()
        recipe_list.append(recipe_data)

    context = {
        'recipes': recipe_list,
        'page_obj': page_obj,
        'latest_recipes': latest_recipes,
        'title': title,
        'tag_message': message,
        'top_rated_recipes': top_rated_recipes
    }

    return render(request, 'home_recipes.html', context)


def recipe_details(request, recipe_id):
    title = 'LoveRecipes: Recipe details'
    recipe = get_object_or_404(Recipe, pk=recipe_id)

    ingredients = json.loads(recipe.ingredients)
    directions = json.loads(recipe.directions)

    my_review = None

    if request.user.is_authenticated:
        # Retrieve reviews and my review for the recipe
        reviews = Review.objects.filter(
            recipe=recipe).exclude(user=request.user)
        my_review = Review.objects.filter(
            recipe=recipe, user=request.user).first()

        # Attach like status and count to each review
        for review in reviews:
            review.liked_by_user = Like.objects.filter(
                review=review, user=request.user).exists()
            review.likes_count = Like.objects.filter(review=review).count()

        if my_review:
            # attach like status and count to the user's own review
            my_review.liked_by_user = Like.objects.filter(
                review=my_review, user=request.user).exists()
            my_review.likes_count = Like.objects.filter(
                review=my_review).count()

    else:
        reviews = Review.objects.filter(recipe=recipe)
        for review in reviews:
            review.likes_count = Like.objects.filter(review=review).count()

    context = {
        'recipe': recipe,
        'ingredients': ingredients,
        'directions': directions,
        'title': title,
        'reviews': reviews,
        'my_review': my_review
    }

    return render(request, 'recipe_details.html', context)


def delete_recipe(request, recipe_id):
    recipe = get_object_or_404(Recipe, id=recipe_id)
    image_path = os.path.join(settings.MEDIA_ROOT, str(recipe.image))
    if os.path.exists(image_path):
        os.remove(image_path)

    recipe.delete()
    sweetify.success(
        request, 'Your recipe has been successfully deleted!', timer=3000)
    return redirect('http://127.0.0.1:8000/')
