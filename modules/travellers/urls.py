from django.urls import path
from .views import (
    home, change_language, arrival, departure, preview, save, cancel,
    success, auto_districts, auto_point_of_entries, generate_pdf
)

app_name = 'travellers'
urlpatterns = [
    path('', home, name='index'),
    path('change_language/<str:lang>', change_language, name='change_language'),
    path('arrival/', arrival, name='arrival'),
    path('preview/<str:pk>', preview, name='preview'),
    path('save/<str:pk>', save, name='save'),
    path('cancel/<str:pk>', cancel, name='cancel'),
    path('pdf/<str:pk>', generate_pdf, name='pdf'),


    path('departure/', departure, name='departure'),
    path('success/', success, name='success'),
    path('auto_districts/', auto_districts, name='auto_districts'),
    path('auto_point_of_entries/', auto_point_of_entries,
         name='auto_point_of_entries')
]
