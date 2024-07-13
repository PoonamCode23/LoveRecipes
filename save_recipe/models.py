from django.db import models
from django.contrib.auth.models import User
from recipe_manager.models import Recipe


class Favorite(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    recipe = models.ForeignKey(Recipe, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)

# a user can only favorite a particular recipe once
    class Meta:
        unique_together = ('user', 'recipe')

    def __str__(self):
       # This model does not have a title attribute, so this line will cause an error

        return f"{self.user.username} - {self.recipe.title}"
