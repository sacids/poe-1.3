from django.urls import path

from .views import dashboard, all_travellers, allowed_proceed, secondary_screen

#app_name='dashboard'

urlpatterns = [
    path('', dashboard, name='dashboard'),
    path('all_travellers/<str:day>/<str:start_at>/<str:end_at>', all_travellers, name='all_travellers'),
    path('allowed_proceed', allowed_proceed, name='allowed_proceed'),
    path('secondary_screening', secondary_screen, name='secondary_screen'),
]
