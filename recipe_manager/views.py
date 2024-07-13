from django.shortcuts import render
from django.core.paginator import Paginator
from django.shortcuts import render, redirect, get_object_or_404
from .forms import RecipeForm
from django.contrib import messages
from .models import Recipe
from django.conf import settings  # for deleting image file
import os  # deleting media folder
from save_recipe.models import Favorite
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
    # Order by descending created_at (latest)
    latest_recipes = Recipe.objects.order_by('-created_at')[:6]

    # Fetch random recipes
    recipes = Recipe.objects.order_by('?')

    message = ""

    tag = request.GET.get('tag')
    if tag:
        # SELECT * FROM Recipe WHERE tags ILIKE '%desserts%';
        recipes = Recipe.objects.filter(tags__icontains=tag).order_by('?')
        message = f"Explore '{tag.upper()}' Recipes"

        # dont show latest recipes if a tag is present
        latest_recipes = []

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
        'tag_message': message
    }
    return render(request, 'home_recipes.html', context)


def recipe_details(request, recipe_id):
    title = 'LoveRecipes: Recipe details'
    recipe = get_object_or_404(Recipe, pk=recipe_id)

    # Assuming ingredients and directions are stored as JSONField in Recipe model
    ingredients = json.loads(recipe.ingredients)
    directions = json.loads(recipe.directions)

    context = {
        'recipe': recipe,
        'ingredients': ingredients,
        'directions': directions,
        'title': title
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
