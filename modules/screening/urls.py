from django.urls import path

from .views import screen, set_temp, update_symptoms, score

urlpatterns = [
    path('', screen, name='screen'),
    path('set_temp', set_temp, name='set_temp'),
    path('update_symptoms', update_symptoms, name='update_symptoms'),
    path('score', score, name='score'),
]
