from django.contrib.auth import authenticate, login
from django.shortcuts import render, redirect
from django.contrib import messages
from .forms import UserRegistrationForm
from django.contrib.auth.decorators import login_required
from recipe_manager.models import Recipe


def register(request):
    title = 'LoveRecipes: Sign Up'

    if request.method == 'POST':
        form = UserRegistrationForm(request.POST)
        if form.is_valid():
            user = form.save()
            login(request, user)
            return redirect('users:user_recipes')
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
            return redirect('users:user_recipes')
        else:
            messages.error(request, 'Invalid username or password.')
            return render(request, 'login.html')
    else:
        return render(request, 'login.html')


@login_required
def user_recipes(request):
    title = 'LoveRecipes: My recipes'
    if not request.user.is_authenticated:
        return redirect('login')

    user_recipes = Recipe.objects.filter(user=request.user)

    context = {
        'username': request.user.username,
        'user_recipes': user_recipes,
        'title': title

    }
    return render(request, 'user_recipes.html', context)
