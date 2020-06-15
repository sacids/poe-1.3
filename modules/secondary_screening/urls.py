from django.urls import path, re_path

from .views import *

urlpatterns = [
    path('', screen_list, name='sec_screen'),
    #re_path(r'^survey/(?P<disease_id>\d+)/$', survey, name='survey'),
    #re_path(r'^manage/(?P<travellers_id>\d+)/$', screen_traveller, name='manage'),
    path('<int:travellers_id>/action/', risk_assessment, name='risk_assessment'),
    path('<int:travellers_id>/info/', traveller_info, name='traveller_info'),
    path('<int:travellers_id>/', screen_traveller, name='screen_traveller'),
    path('<int:travellers_id>/<int:disease_id>/', survey, name='survey')
]
