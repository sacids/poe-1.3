from django.urls import path

from .views import *

urlpatterns = [
    path('set_poe', set_poe, name='set_poe')
]
