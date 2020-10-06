from django.urls import path
from .views import (
    default, change_language_en, change_language_sw, arrival, departure,
    success, auto_districts, auto_point_of_entries
)

app_name = 'travellers'
urlpatterns = [
    path('', default, name='index'),
    path('change_language_en', change_language_en, name='change_language_en'),
    path('change_language_sw', change_language_sw, name='change_language_sw'),
    path('arrival/', arrival, name='arrival'),
    path('departure/', departure, name='departure'),
    path('success/', success, name='success'),
    path('auto_districts/', auto_districts, name='auto_districts'),
    path('auto_point_of_entries/', auto_point_of_entries, name='auto_point_of_entries')
]
