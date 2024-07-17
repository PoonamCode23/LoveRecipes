from django.shortcuts import redirect, get_object_or_404
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from .models import Review
from recipe_manager.models import Recipe  # Import your Recipe model


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

        messages.success(request, 'Thank you for your review!')

    return redirect('recipe_manager:recipe_details', recipe_id=recipe_id)
