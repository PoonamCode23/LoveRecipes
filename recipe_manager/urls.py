from django.urls import path
from . import views

app_name = 'recipe_manager'

urlpatterns = [
    path('upload_recipes/', views.upload_recipe, name='create'),
    path('', views.view_recipes, name='view_recipes'),

]
