"""
URL configuration for recipes project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static


urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('recipe_manager.urls')),
    path('', include('categorize.urls')),
    path('', include('users.urls')),
    path('', include('save_recipe.urls')),
    path('',  include('ratings_reviews.urls')),

    # when we will upload image, it will allow to create URL automatically.
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
