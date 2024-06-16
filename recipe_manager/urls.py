from django.urls import path
from . import views

app_name = 'recipe_manager'

urlpatterns = [
    path('create/', views.upload_recipe, name='create'),
    path('', views.home, name='home'),
]
