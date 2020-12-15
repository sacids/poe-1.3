from django.urls import path, include
from rest_framework import routers
from .views import TravellerViewSet, TravellerVisitedAreaViewSet

router = routers.DefaultRouter()

router.register('travellers', TravellerViewSet)
router.register('travellers-visited-area', TravellerVisitedAreaViewSet)

#  app_name = 'api'

urlpatterns = [
    #  path('', default, name='index'),
    path('', include(router.urls)),
    path('api-auth/', include('rest_framework.urls')),

]
