from django.urls import path

from .views import default, international, domestic, auto_districts

app_name = 'travellers'
urlpatterns = [
    path('', default, name='index'),
    path('international/', international, name='international'),
    path('domestic/', domestic, name='domestic'),
    path('auto_districts/', auto_districts, name='auto_districts')
]

