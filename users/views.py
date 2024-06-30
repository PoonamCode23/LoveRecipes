from django.shortcuts import render, redirect
from .forms import UserRegistrationForm


def register(request):
    title = 'LoveRecipes: Sign Up'

    if request.method == 'POST':
        form = UserRegistrationForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('')
    else:
        form = UserRegistrationForm()

    context = {
        'form': form,
        'title': title,
        'username': request.user.username if request.user.is_authenticated else None
    }
    return render(request, 'register.html', context)
