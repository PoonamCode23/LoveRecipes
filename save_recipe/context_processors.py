from .models import Favorite


def saved_recipes_count(request):

    saved_recipes_count = Favorite.objects.filter(
        user=request.user).count()

    return {'saved_recipes_count': saved_recipes_count}

# add this line inside templates of settings.py
# 'save_recipe.context_processors.saved_recipes_count',
