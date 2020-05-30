from django.urls import path
from .views import default, international, domestic

urlpatterns = [
    path('', default, name='home'),
    path('domestic/', domestic, name='domestic'),
    path('international/', international, name='international'),
]