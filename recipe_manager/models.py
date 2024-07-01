from django.db import models
from django.contrib.auth.models import User
import json


class Recipe(models.Model):
    title = models.CharField(max_length=200)
    description = models.TextField()
    image = models.ImageField(upload_to='images/')
    ingredients = models.TextField()
    directions = models.TextField()
    time_required = models.TextField()
    servings = models.IntegerField()
    tags = models.TextField(default='[]')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE)

    def __str__(self):
        return self.title

    def set_ingredients(self, ingredients):
        self.ingredients = json.dumps(ingredients)

    def get_ingredients(self):
        return json.loads(self.ingredients)

    def set_directions(self, directions):
        self.directions = json.dumps(directions)

    def get_directions(self):
        return json.loads(self.directions)

    def set_tags(self, tags):
        self.tags = json.dumps(tags)

    def get_tags(self):
        return json.loads(self.tags)
