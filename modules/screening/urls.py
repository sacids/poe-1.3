from django.urls import path, re_path

from .views import *

urlpatterns = [
    path('', screen, name='screen'),
    path('set_temp', set_temp, name='set_temp'),
    path('score', score, name='score'),
]
