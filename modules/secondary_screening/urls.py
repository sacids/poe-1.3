from django.urls import path, re_path

from .views import *

urlpatterns = [
    path('', screen_list, name='sec_screen'),
    path('<int:travellers_id>/action/', risk_assessment, name='risk_assessment'),
    path('<int:travellers_id>/info/', traveller_info, name='traveller_info'),
    path('<int:travellers_id>/', screen_traveller, name='screen_traveller'),
    path('<int:travellers_id>/<int:disease_id>/', survey, name='survey')
]
