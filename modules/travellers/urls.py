from django.urls import path

from .views import default, international, domestic

app_name = 'travellers'
urlpatterns = [
    path('', default, name='index'),
    path('international/', international, name='international'),
    path('domestic/', domestic, name='domestic')
]
