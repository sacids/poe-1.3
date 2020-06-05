from django.db import models
from phone_field import PhoneField
from modules.common.models import BaseModel

FORM_TYPE = (
    ('international', "INTERNATIONAL"),
    ('domestic', "DOMESTIC"),
)
SEX = (
    ('male', "MALE"),
    ('female', "FEMALE"),
)
ACTIVE = (
    ('True', "1"),
    ('False', "0"),
)
ID_TYPE = (
    ('passport-number', "PASSPORT NUMBER"),
    ('national-id', "NATIONAL ID"),
    ('voter-id', "VOTER ID"),
)
TRANSPORT_MODE = (
    ('flight', 'FLIGHT'),
    ('vehicle', 'VEHICLE'),
    ('vessel', 'VESSEL'),
)
PURPOSE = (
    ('resident', 'RESIDENT'),
    ('tourist', 'TOURIST'),
    ('transit', 'TRANSIT'),
    ('business', 'BUSINESS'),
)
EMPLOYMENT = (
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
    disease = models.ForeignKey(Disease, on_delete=models.PROTECT)
    symptom = models.ForeignKey(Symptom, on_delete=models.PROTECT)
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

class ScreenCriteria(models.Model):
    disease     = models.ForeignKey(Disease,on_delete=models.PROTECT)
    countries   = models.CharField(max_length=250)
    symptoms    = models.CharField(max_length=250)
    temp        = models.CharField(max_length=250)
    active      = models.CharField(choices=ACTIVE, max_length=1, default='0')

    class Meta:
        db_table = "et_ss_criteria"


class LocationDisease(models.Model):
    location = models.ForeignKey(Location, on_delete=models.PROTECT)
    disease = models.ForeignKey(Disease, on_delete=models.PROTECT)
    score = models.PositiveIntegerField()

    class Meta:
        db_table = "et_location_diseases"


# point of entries
class PointOfEntry(models.Model):
    title = models.CharField(max_length=255)
    region_id = models.ForeignKey(Location, on_delete=models.PROTECT)
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
    other_employment = models.CharField(max_length=255, blank=True, null=True)

    mode_of_transport = models.CharField(choices=TRANSPORT_MODE, max_length=30, default='none')
    name_of_transport = models.CharField(max_length=30)
    seat_no = models.CharField(max_length=30)
    arrival_date = models.DateField(verbose_name="Arrival Date")
    point_of_entry = models.ForeignKey(PointOfEntry, on_delete=models.DO_NOTHING)

    visiting_purpose = models.CharField(choices=PURPOSE, max_length=45, default='none')  # to look around
    other_purpose = models.TextField()
    duration_of_stay = models.PositiveIntegerField
    location_origin = models.ForeignKey(Location, on_delete=models.DO_NOTHING)

    physical_address = models.TextField()
    hotel_name = models.CharField(max_length=255)
    region_id = models.PositiveIntegerField  # to look around
    district_id = models.PositiveIntegerField  # to look around
    street_or_ward = models.CharField(max_length=100)  # to look around
    phone = PhoneField(null=True, help_text='Contact Phone Number')
    email = models.EmailField(max_length=255)

    temp = models.FloatField()
    disease_to_screen = models.CharField(max_length=150, default='0')
    action_taken = models.CharField(max_length=100)
    updated_at = models.DateTimeField("Updated At Date")

    class Meta(BaseModel.Meta):
        db_table = "et_travellers"

    def __str__(self):
        return self.full_name
    
    def natural_key(self):
        return self.my_natural_key


# Traveller visited area
class TravellerVisitedArea(models.Model):
    traveller = models.ForeignKey(Traveller, on_delete=models.PROTECT)
    location = models.ForeignKey(Location, on_delete=models.DO_NOTHING)
    location_visited = models.CharField(max_length=250)
    date = models.DateField(verbose_name="Date")
    days = models.PositiveIntegerField()

    class Meta:
        db_table = "et_traveller_visited_areas"


# Traveller symptoms
class TravellerSymptoms(models.Model):
    traveller = models.ForeignKey(Traveller, on_delete=models.PROTECT)
    symptom = models.ForeignKey(Symptom, on_delete=models.DO_NOTHING)

    class Meta:
        db_table = "et_traveller_symptoms"

# todo:secondary screening
