from django.shortcuts import render, redirect
from .forms import RecipeForm
from .models import Recipe
import json


def upload_recipe(request):
    if request.method == 'POST':
        form = RecipeForm(request.POST, request.FILES)
        if form.is_valid():
            ingredients = form.cleaned_data['ingredients']
            directions = form.cleaned_data['directions']
            tags = form.cleaned_data['tags']

            recipe = form.save(commit=False)
            recipe.set_ingredients(ingredients)
            recipe.set_directions(directions)
            recipe.set_tags(tags)
            recipe.save()
            return redirect('http://127.0.0.1:8000/')

        else:
            print("Form errors:", form.errors)
    else:
        form = RecipeForm()
    return render(request, 'create_recipes.html', {'form': form})


def view_recipes(request):

    # Fetch random recipes
    recipes = Recipe.objects.order_by('?')[:15]

    recipe_list = []
    for recipe in recipes:
        recipe_data = {
            'id': recipe.id,
            'image': recipe.image,
            'title': recipe.title,
            'description': recipe.description,
            'tags': json.loads(recipe.tags)
        }
        recipe_list.append(recipe_data)

    return render(request, 'home_recipes.html', {'recipes': recipe_list})
