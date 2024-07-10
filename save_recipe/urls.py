from django.urls import path
from . import views

app_name = 'save_recipe'

urlpatterns = [
    path('save/', views.save_recipe, name='save_recipe'),
    path('saved_recipes/', views.saved_recipes, name='saved_recipes'),
]
