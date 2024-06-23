from django.urls import path
from . import views

app_name = 'recipe_manager'

urlpatterns = [
    path('upload_recipes/', views.upload_recipe, name='create'),
    path('', views.view_recipes, name='view_recipes'),

    path('recipe_details/<int:recipe_id>/',
         views.recipe_details, name='recipe_details'),

    path('update_recipes/<int:recipe_id>/',
         views.update_recipe, name='update_recipes'),


]
