from django.contrib import admin
from django.urls import path, include

from fly_django import core

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('fly_django.core.urls')),
]
