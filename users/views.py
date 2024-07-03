from django.contrib.auth import authenticate, login, logout
from django.shortcuts import render, redirect, get_object_or_404
from .forms import UserRegistrationForm
from django.contrib.auth import get_user_model
from django.contrib.auth.decorators import login_required
from recipe_manager.models import Recipe
import json


def register(request):
    title = 'LoveRecipes: Sign Up'

    if request.method == 'POST':
        form = UserRegistrationForm(request.POST)
        if form.is_valid():
            user = form.save()
            login(request, user)
            return redirect('users:view_my_recipes')
    else:
        form = UserRegistrationForm()

    context = {
        'form': form,
        'title': title,

    }
    return render(request, 'register.html', context)


def user_login(request):
    if request.method == 'POST':
        username = request.POST.get("username")
        password = request.POST.get("password")
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            return redirect('users:view_my_recipes')
        else:
            messages.error(request, 'Invalid username or password.')
            return render(request, 'login.html')
    else:
        return render(request, 'login.html')


@login_required
def view_my_recipes(request):
    title = 'LoveRecipes: My recipes'
    if not request.user.is_authenticated:
        return redirect('login')

    user_recipes = Recipe.objects.filter(user=request.user)

    recipe_list = []
    for recipe in user_recipes:
        recipe_data = {
            'id': recipe.id,
            'image': recipe.image,
            'title': recipe.title,
            'description': recipe.description,
            'tags': json.loads(recipe.tags)
        }
        recipe_list.append(recipe_data)

    context = {
        'username': request.user.username,
        'recipes': recipe_list,
        'title': title
    }
    return render(request, 'user_recipes.html', context)


def view_user_recipes(request, user_id):
    User = get_user_model()
    user = get_object_or_404(User, id=user_id)
    title = f'LoveRecipes: Recipes by {user.username}'
    recipes = Recipe.objects.filter(user=user)

    recipe_list = []
    for recipe in recipes:
        recipe_data = {
            'id': recipe.id,
            'image': recipe.image,
            'title': recipe.title,
            'description': recipe.description,
            'tags': json.loads(recipe.tags),
        }
        recipe_list.append(recipe_data)

    context = {
        'user_username': user.username,
        'user_recipes': recipe_list,
        'title': title
    }

    return render(request, 'user_recipes.html', context)


def user_logout(request):
    logout(request)
    return redirect('recipe_manager:view_recipes')
