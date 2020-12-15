from django.urls import path

from .views import screen, set_temp, update_symptoms, score, immigration

urlpatterns = [
    path('', screen, name='screen'),
    path('immigration', immigration, name='immigration'),
    path('set_temp', set_temp, name='set_temp'),
    path('update_symptoms', update_symptoms, name='update_symptoms'),
    path('score', score, name='score'),
]
