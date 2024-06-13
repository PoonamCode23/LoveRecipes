from django.shortcuts import render, redirect
from .forms import RecipeForm
from .models import Recipe


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
            return redirect('recipe_manager:home')

        else:
            print("Form errors:", form.errors)
    else:
        form = RecipeForm()
    return render(request, 'create_recipes.html', {'form': form})


def home(request):
    return render(request, 'home.html')
