from django.urls import path
from . import views

app_name = 'ratings_reviews'

urlpatterns = [
    path('save_review/', views.save_review, name='save_review'),
    path('update/<int:review_id>/', views.update_review, name='update_review'),
    path('like_review/<int:review_id>/<int:recipe_id>/',
         views.like_review, name='like_review'),

]
