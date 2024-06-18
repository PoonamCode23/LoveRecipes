from django import forms
from django.core.validators import MaxLengthValidator
from .models import Recipe


class RecipeForm(forms.ModelForm):
    title = forms.CharField(
        widget=forms.TextInput(attrs={'class': 'form-control'})
    )

    description = forms.CharField(
        widget=forms.Textarea(
            attrs={
                'class': 'form-control',
                'style': 'height: 160px; resize: vertical;',
                'maxlength': 130
            }
        ),
        validators=[MaxLengthValidator(150)]
    )

    image = forms.ImageField(
        widget=forms.FileInput(attrs={
            'id': 'image-upload',
            'accept': 'image/*',
            'style': 'display: none;',
            'onchange': 'showFile(event)'
        })
    )
    ingredients = forms.CharField(
        widget=forms.TextInput(
            attrs={'class': 'form-control', 'placeholder': 'e.g. 2 cups flour'})
    )
    directions = forms.CharField(
        widget=forms.TextInput(attrs={
                               'class': 'form-control', 'placeholder': 'e.g. Preheat oven to 200 degrees.....', 'maxlength': '50'})
    )
    time_required = forms.CharField(
        widget=forms.TextInput(
            attrs={'class': 'form-control', 'placeholder': 'e.g. 20 mins'})
    )
    servings = forms.CharField(
        widget=forms.NumberInput(
            attrs={'class': 'form-control', 'type': 'number', 'placeholder': 'e.g. 8'})
    )
    tags = forms.CharField(
        widget=forms.TextInput(
            attrs={'class': 'form-control', 'placeholder': 'e.g. gluten-free'}),
        required=False
    )

    class Meta:
        model = Recipe
        fields = ['title', 'description', 'image', 'ingredients',
                  'directions', 'time_required', 'servings', 'tags']

    def clean_ingredients(self):
        ingredients = self.data.getlist('ingredients')
        ingredients = [ingredient.strip()
                       for ingredient in ingredients if ingredient.strip()]
        return ingredients

    def clean_directions(self):
        directions = self.data.getlist('directions')
        directions = [direction.strip()
                      for direction in directions if direction.strip()]
        return directions

    def clean_tags(self):
        tags = self.data.getlist('tags')  # Get all tags inputs as a list
        tags = [tag.strip() for tag in tags if tag.strip()]
        return tags
