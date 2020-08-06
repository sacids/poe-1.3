from django.urls import path
from . import views

from .views import default, change_language_en, change_language_sw, international, domestic, success, auto_districts, auto_point_of_entries

app_name = 'travellers'
urlpatterns = [
    path('', default, name='index'),
    path('change_language_en', views.change_language_en, name='change_language_en'),
    path('change_language_sw', views.change_language_sw, name='change_language_sw'),
    path('international/', international, name='international'),
    path('domestic/', domestic, name='domestic'),
    path('success/', success, name='success'),
    path('auto_districts/', auto_districts, name='auto_districts'),
    path('auto_point_of_entries/', auto_point_of_entries, name='auto_point_of_entries')
]
