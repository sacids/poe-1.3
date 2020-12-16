from rest_framework import serializers
from modules.travellers.models import Traveller, TravellerVisitedArea


class TravellerSerializer(serializers.ModelSerializer):
    """
    A serializer representing the Travellers details excluding health information
    """

    class Meta:
        model = Traveller
        exclude = ('temp', 'disease_to_screen', 'symptoms', 'other_symptoms')


class TravellerVisitedAreaSerializer(serializers.ModelSerializer):
    """
    Represents the serializer for the for Areas visited by the Traveller
    """

    class Meta:
        model = TravellerVisitedArea
        fields = '__all__'
