from django.urls import path, re_path

from .views import *

urlpatterns = [
    path('', screen, name='screen'),
    re_path(r'^$', travellers_asJson, name='ajax_url')
]
