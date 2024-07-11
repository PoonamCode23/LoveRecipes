from django.shortcuts import render
from recipe_manager.models import Recipe
# differentiate save and unsaved recipe while searching too(utils.py)
from save_recipe.models import Favorite
import json


def search_recipes(request):
    title = 'LoveRecipes: Search recipes'
    keyword = request.GET.get('search')
    recipes = []

    if keyword:
        # case-insensitive search
        recipes = Recipe.objects.filter(
            title__icontains=keyword).order_by('?')[:10]

    if recipes.exists():
        search_message = f"Recipe for '{keyword}'"
    else:
        search_message = f"No results found for '{
            keyword}'.... Please try searching other recipes."

    recipe_list = []
    for recipe in recipes:
        is_favorite = Favorite.objects.filter(
            user=request.user, recipe=recipe).exists()

        recipe_data = {
            'id': recipe.id,
            'image': recipe.image,
            'title': recipe.title,
            'description': recipe.description,
            'tags': json.loads(recipe.tags) if recipe.tags else [],
            'user_id': recipe.user.id,
            'user': recipe.user.username,
            'is_favorite': is_favorite
        }
        recipe_list.append(recipe_data)

    context = {
        'title': title,
        'recipes': recipe_list,
        'keyword': keyword,
        'search_message': search_message,
    }

    return render(request, 'home_recipes.html', context)
