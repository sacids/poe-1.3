from django.urls import path

from .views import default, international, domestic, success, auto_districts, auto_point_of_entries

app_name = 'travellers'
urlpatterns = [
    path('', default, name='index'),
    path('international/', international, name='international'),
    path('domestic/', domestic, name='domestic'),
    path('success/', success, name='success'),
    path('auto_districts/', auto_districts, name='auto_districts'),
    path('auto_point_of_entries/', auto_point_of_entries, name='auto_point_of_entries')
]
