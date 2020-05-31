from django.urls import path

from . import views

app_name = 'travellers'
urlpatterns = [
    path('', views.index, name='index'),
    path('/international', views.international, name='international'),
    path('/domestic', views.domestic, name='domestic')
]
