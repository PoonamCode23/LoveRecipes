
from django.urls import path
from . import views

app_name = 'users'


urlpatterns = [
    path('register/', views.register, name='register'),
    path('login/', views.user_login, name='user_login'),
    path('logout/', views.user_logout, name='user_logout'),
    path('my_recipes/', views.view_my_recipes, name='view_my_recipes'),
    path('user-recipes/<int:user_id>/',
         views.view_user_recipes, name='view_user_recipes')
]
