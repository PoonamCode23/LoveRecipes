from django.shortcuts import redirect, get_object_or_404, resolve_url
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from .models import Review
from .models import Like
from recipe_manager.models import Recipe
import sweetify


@login_required(login_url='/login/')
def save_review(request):
    if request.method == 'POST':
        recipe_id = request.POST.get('recipe_id')
        rating = request.POST.get('rating')
        comments = request.POST.get('review')
        user = request.user

        # Get the recipe object
        recipe = get_object_or_404(Recipe, id=recipe_id)

        # Create a new review object
        review = Review.objects.create(
            recipe=recipe,
            user=user,
            ratings=rating,
            comments=comments
        )

        sweetify.success(
            request, "Thank you for your reviews", timer=2000, position='top-end')

    return redirect('recipe_manager:recipe_details', recipe_id=recipe_id)


@login_required(login_url='/login/')
def update_review(request, review_id):
    review = get_object_or_404(Review, id=review_id)

    if request.method == 'POST':
        rating = request.POST.get('rating')
        comments = request.POST.get('review')

        # Update existing review object
        review.ratings = rating
        review.comments = comments
        review.save()

    return redirect('{}#review-section'.format(resolve_url('recipe_manager:recipe_details', recipe_id=review.recipe.id)))


@login_required(login_url='/login/')
def like_review(request, review_id, recipe_id):
    review = get_object_or_404(Review, id=review_id)
    user = request.user

    if request.method == 'POST':
        existing_like = Like.objects.filter(review=review, user=user).first()

        if existing_like:
            existing_like.delete()
        else:
            Like.objects.create(review=review, user=user)

    return redirect('{}#like-form'.format(resolve_url('recipe_manager:recipe_details', recipe_id=recipe_id)))
