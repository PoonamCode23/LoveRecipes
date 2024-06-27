from django.urls import path
from . import views

app_name = 'categorize'

urlpatterns = [
    path('serach/', views.search_recipes, name='search_recipes'),
]
