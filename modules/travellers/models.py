from django.db import models
from phone_field import PhoneField
from modules.screening.models import Conditions
from modules.common.models import BaseModel

FORM_TYPE = (
    ('international', "INTERNATIONAL"),
    ('domestic', "DOMESTIC"),
)
SEX = (
    ('none', "--Select--"),
    ('male', "MALE"),
    ('female', "FEMALE"),
)
ID_TYPE = (
    ('none', "--Select--"),
    ('passport-number', "PASSPORT NUMBER"),
    ('national-id', "NATIONAL ID"),
    ('voter-id', "VOTER ID"),
)
TRANSPORT_MODE = (
    ('none', "--Select--"),
    ('flight', 'FLIGHT'),
    ('vehicle', 'VEHICLE'),
    ('vessel', 'VESSEL'),
)
PURPOSE = (
    ('none', "--Select--"),
    ('resident', 'RESIDENT'),
    ('tourist', 'TOURIST'),
    ('transit', 'TRANSIT'),
    ('business', 'BUSINESS'),
)
EMPLOYMENT = (
    ('none', "--Select--"),
    ('government', 'GOVERNMENT'),
    ('non-government', 'NON-GOVERNMENT'),
    ('non-profit', 'NON-PROFIT'),
    ('student', 'STUDENT'),
    ('business', 'BUSINESS'),
    ('religious', 'RELIGIOUS'),
)


# diseases
class Disease(models.Model):
    title = models.CharField(max_length=100)

    class Meta:
        db_table = "et_diseases"


# symptoms
class Symptom(models.Model):
    title = models.CharField(max_length=100)
    alias = models.CharField(max_length=100)

    class Meta:
        db_table = "et_symptoms"


class DiseaseSymptom(models.Model):
    disease = models.ForeignKey(Disease, on_delete=models.CASCADE)
    symptom = models.ForeignKey(Symptom, on_delete=models.CASCADE)
    score = models.PositiveIntegerField()

    class Meta:
        db_table = 'et_disease_symptoms'


# locations
class Location(models.Model):
    title = models.CharField(max_length=50)
    code = models.CharField(max_length=5)
    parent = models.PositiveIntegerField()

    class Meta:
        db_table = "et_locations"


class LocationDisease(models.Model):
    location = models.ForeignKey(Location, on_delete=models.CASCADE)
    disease = models.ForeignKey(Disease, on_delete=models.CASCADE)
    score = models.PositiveIntegerField()

    class Meta:
        db_table = "et_location_diseases"


# point of entries
class PointOfEntry(models.Model):
    title = models.CharField(max_length=255)
    region = models.PositiveIntegerField()  # to look around
    district = models.PositiveIntegerField  # to look around
    mode_of_transport = models.CharField(max_length=50)

    class Meta:
        db_table = "et_point_of_entries"


# travellers
class Traveller(BaseModel):
    full_name = models.CharField(max_length=250)
    type = models.CharField(choices=FORM_TYPE, max_length=25, default='none')
    sex = models.CharField(choices=SEX, max_length=15, default='none')
    age = models.PositiveIntegerField()
    id_type = models.CharField(choices=ID_TYPE, max_length=50, default='none')
    id_number = models.CharField(max_length=50)
    employment = models.CharField(choices=EMPLOYMENT, max_length=45, default='none')
    other_employment = models.CharField(max_length=255)

    mode_of_transport = models.CharField(choices=TRANSPORT_MODE, max_length=30, default='none')
    name_of_transport = models.CharField(max_length=30)
    seat_no = models.CharField(max_length=30)
    arrival_date = models.DateField(verbose_name="Arrival Date")
    point_of_entry = models.ForeignKey(PointOfEntry, on_delete=models.DO_NOTHING)

    visiting_purpose = models.CharField(choices=PURPOSE, max_length=45, default='none')  # to look around
    other_purpose = models.TextField()
    duration_of_stay = models.PositiveIntegerField()
    location_origin = models.ForeignKey(Location, on_delete=models.DO_NOTHING)

    physical_address = models.TextField()
    hotel_name = models.CharField(max_length=255)
    region = models.PositiveIntegerField  # to look around
    district = models.PositiveIntegerField  # to look around
    street_or_ward = models.CharField(max_length=255)  # to look around
    phone = PhoneField(null=True, help_text='Contact Phone Number')
    email = models.EmailField(max_length=255)

    temp = models.IntegerField()
    score = models.PositiveIntegerField
    action_taken = models.CharField(max_length=50)
    created_at = models.DateTimeField('created_date')

    class Meta:
        db_table = "et_travellers"


# Traveller visited area
class TravellerVisitedArea(models.Model):
    traveller = models.ForeignKey(Traveller, on_delete=models.CASCADE)
    location = models.ForeignKey(Location, on_delete=models.DO_NOTHING)  # to look around
    location_visited = models.CharField(max_length=250)
    date = models.DateField(verbose_name="Date")
    days = models.PositiveIntegerField()

    class Meta:
        db_table = "et_traveller_visited_areas"


# Traveller symptoms
class TravellerSymptoms(models.Model):
    traveller = models.ForeignKey(Traveller, on_delete=models.CASCADE)
    symptom = models.ForeignKey(Symptom, on_delete=models.DO_NOTHING)

    class Meta:
        db_table = "et_traveller_symptoms"
