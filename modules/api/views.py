from rest_framework import viewsets
from .serializers import TravellerSerializer, TravellerVisitedAreaSerializer
from modules.travellers.models import Traveller, TravellerVisitedArea


class TravellerViewSet(viewsets.ModelViewSet):
    """
    List all the details for the Traveller
    """
    serializer_class = TravellerSerializer
    queryset = Traveller.objects.all()
    http_method_names = ['get']


class TravellerVisitedAreaViewSet(viewsets.ModelViewSet):
    """
    List all the areas the Traveller has visited
    """
    serializer_class = TravellerVisitedAreaSerializer
    queryset = TravellerVisitedArea.objects.all()
    http_method_names = ['get']
