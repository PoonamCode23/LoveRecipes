from django.shortcuts import redirect, get_object_or_404, render
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from .models import Favorite
from recipe_manager.models import Recipe
import sweetify


@login_required(login_url='/login/')
def save_recipe(request):

    if request.method == 'POST':
        recipe_id = request.POST.get('recipe_id')
        user = request.user

        # Check if the recipe is already saved as a favorite
        favorite = Favorite.objects.filter(
            user=user, recipe_id=recipe_id).first()

        if not favorite:
            # Recipe is not saved as a favorite, so save it
            favorite = Favorite.objects.create(user=user, recipe_id=recipe_id)
            sweetify.success(
                request,
                'Recipe added to favorites.',
                timer=3000,
                position='top-end',

            )
        else:
            # Recipe is already saved as a favorite, so delete it
            favorite.delete()
            sweetify.success(
                request,
                'Recipe removed from favorites.',
                timer=3000,
                position='top-end'
            )

        # Redirect to the previous page
        # return redirect(request.META.get('HTTP_REFERER', '/'))
        return redirect('save_recipe:saved_recipes')


@login_required
def saved_recipes(request):
    title = 'LoveRecipes: My Favourite Recipes'
    user = request.user
    if user.is_authenticated:
        saved_recipes = Favorite.objects.filter(user=user)

    context = {
        'title': title,
        'saved_recipes': saved_recipes,
    }

    return render(request, 'saved_recipes.html', context)
