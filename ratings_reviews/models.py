from django.db import models
from django.contrib.auth.models import User
from recipe_manager.models import Recipe


class Review(models.Model):
    recipe = models.ForeignKey(Recipe, on_delete=models.CASCADE)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    ratings = models.IntegerField()
    comments = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f'Review by {self.user.username} for {self.recipe.title}'


class Like(models.Model):
    review = models.ForeignKey(
        Review, on_delete=models.CASCADE, related_name='likes')
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        # Prevent multiple likes from the same user on the same review
        unique_together = ('review', 'user')

    def __str__(self):
        return f'{self.user.username} liked review for "{self.review.recipe.title}"'
