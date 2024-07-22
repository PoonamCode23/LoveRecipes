# from django.shortcuts import render
# from recipe_manager.models import Recipe
# # differentiate save and unsaved recipe while searching too(utils.py)
# from save_recipe.models import Favorite
# import json


# def search_recipes(request):
#     title = 'LoveRecipes: Search recipes'
#     keyword = request.GET.get('search')
#     recipes = []

#     if keyword:
#         # case-insensitive search
#         recipes = Recipe.objects.filter(
#             title__icontains=keyword).order_by('?')[:10]

#     if recipes.exists():
#         search_message = f"Recipe for '{keyword}'"
#     else:
#         search_message = f"No results found for '{
#             keyword}'.... Please try searching other recipes."

#     recipe_list = []
#     for recipe in recipes:
#         is_favorite = False  # Default to False for anonymous users
#         if request.user.is_authenticated:  # Check if user is authenticated
#             is_favorite = Favorite.objects.filter(
#                 user=request.user, recipe=recipe).exists()

#             recipe_data = {
#                 'id': recipe.id,
#                 'image': recipe.image,
#                 'title': recipe.title,
#                 'description': recipe.description,
#                 'tags': json.loads(recipe.tags) if recipe.tags else [],
#                 'user_id': recipe.user.id,
#                 'user': recipe.user.username,
#                 'is_favorite': is_favorite
#             }
#             recipe_list.append(recipe_data)

#     context = {
#         'title': title,
#         'recipes': recipe_list,
#         'keyword': keyword,
#         'search_message': search_message,
#     }

#     return render(request, 'home_recipes.html', context)

from django.shortcuts import render
from recipe_manager.models import Recipe
from save_recipe.models import Favorite
from django.db.models import Avg
from django.db.models.functions import Round
from ratings_reviews.models import Review
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

    for recipe in recipes:
        # function from django.db.models.functions is designed for use within database queries, not directly on Python variables
        average_rating = recipe.review_set.aggregate(
            rounded_avg=Round(Avg('ratings')))['rounded_avg']
        review_count = recipe.review_set.count()

        recipe.average_rating = average_rating
        recipe.review_count = review_count

    recipe_list = []
    for recipe in recipes:
        recipe_data = {
            'id': recipe.id,
            'image': recipe.image,
            'title': recipe.title,
            'description': recipe.description,
            'tags': json.loads(recipe.tags) if recipe.tags else [],
            'user_id': recipe.user.id,
            'user': recipe.user.username,
            'average_rating': recipe.average_rating,
            'review_count': recipe.review_count,
        }

        if request.user.is_authenticated:
            is_favorite = Favorite.objects.filter(
                user=request.user, recipe=recipe).exists()
            recipe_data['is_favorite'] = is_favorite

        recipe_list.append(recipe_data)

    context = {
        'title': title,
        'recipes': recipe_list,
        'keyword': keyword,
        'search_message': search_message,
    }

    return render(request, 'home_recipes.html', context)
