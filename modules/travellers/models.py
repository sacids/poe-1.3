from django.db import models
from phone_field import PhoneField
from django.contrib.postgres.fields import ArrayField
from modules.common.models import BaseModel
from django.contrib.auth.models import User

FORM_TYPE = (
    ('international', "INTERNATIONAL"),
    ('domestic', "DOMESTIC"),
)
SEX = (
    ('M', "Male"),
    ('F', "Female"),
)
ACTIVE = (
    ('1', "1"),
    ('0', "0"),
)
ID_TYPE = (
    ('passport-number', "PASSPORT NUMBER"),
    ('national-id', "NATIONAL ID"),
    ('voter-id', "VOTER ID"),
)
TRANSPORT_MODE = (
    ('flight', 'Flight'),
    ('vehicle', 'Vehicle'),
    ('vessel', 'Vessel'),
    ('train', 'Train'),
)
TRANSPORT_CATEGORY = (
    ('Ground crossing', 'Ground crossing'),
    ('Dry port', 'Dry port'),
    ('Airport', 'Airport'),
    ('Lakeport', 'Lakeport'),
    ('Seaport', 'Seaport'),
    ('Railway', 'Railway'),
)
PURPOSE = (
    ('resident', 'Resident'),
    ('tourist', 'Tourist'),
    ('transit', 'Transit'),
    ('business', 'Business'),
)
EMPLOYMENT = (
    ('government', 'Government'),
    ('non-government', 'Non-Government'),
    ('non-profit', 'Non-Profit'),
    ('student', 'Student'),
    ('business', 'Business'),
    ('religious', 'Religious'),
    ('farmers', 'Farmer'),
)


# diseases
class Disease(models.Model):
    """A class to create disease table."""
    title = models.CharField(max_length=100)

    def __str__(self):
        return self.title

    class Meta:
        db_table = "et_diseases"
        verbose_name_plural = "Diseases"


# symptoms
class Symptom(models.Model):
    """A class to create symptoms table."""
    title = models.CharField(max_length=100)
    alias = models.CharField(max_length=150, null=True)

    class Meta:
        db_table = "et_symptoms"
        verbose_name_plural = "Symptoms"

    def __str__(self):
        return self.title


class DiseaseSymptom(models.Model):
    """A class to create disease symptoms table."""
    disease = models.ForeignKey(Disease, on_delete=models.PROTECT)
    symptom = models.ForeignKey(Symptom, on_delete=models.PROTECT)
    score = models.PositiveIntegerField()

    class Meta:
        db_table = 'et_disease_symptoms'
        verbose_name_plural = "Disease Sysmptoms"


# locations
class Location(models.Model):
    """A class to create location table."""
    title = models.CharField(max_length=50)
    code = models.CharField(max_length=5, null=True)
    parent = models.PositiveIntegerField()

    class Meta:
        db_table = "et_locations"
        verbose_name_plural = "Locations"

    def __str__(self):
        return self.title


class ScreenCriteria(models.Model):
    """A class to create screening criteria table."""
    disease = models.ForeignKey(Disease, on_delete=models.PROTECT)
    countries = models.ManyToManyField(Location,related_name='countries',blank=True)
    symptoms = models.ManyToManyField(Symptom,related_name='symptoms',blank=True)
    temp = models.CharField(max_length=250,blank=True, null=True)
    active = models.CharField(choices=ACTIVE, max_length=1, default='0')

    class Meta:
        db_table = "et_ss_criteria"
        verbose_name_plural = "Screening Criteria"


class LocationDisease(models.Model):
    """A class to create location diseases table."""
    location = models.ForeignKey(Location, on_delete=models.PROTECT)
    disease = models.ForeignKey(Disease, on_delete=models.PROTECT)
    score = models.PositiveIntegerField()

    class Meta:
        db_table = "et_location_diseases"


# point of entries
class PointOfEntry(models.Model):
    """A class to create point of entries table."""
    title               = models.CharField(max_length=255)
    mode_of_transport   = models.CharField(choices=TRANSPORT_MODE, max_length=50,  null=True)
    category            = models.CharField(choices=TRANSPORT_CATEGORY, max_length=50,null=True)
    agents              = models.ManyToManyField(User, blank=True)

    class Meta:
        db_table = "et_point_of_entries"
        verbose_name_plural = "Point of Entries"

    def __str__(self):
        return self.title


# travellers
class Traveller(BaseModel):
    """A class to create travellers table."""
    full_name = models.CharField(max_length=250)
    type = models.CharField(choices=FORM_TYPE, max_length=25, default='none')
    sex = models.CharField(choices=SEX, max_length=15, default='none')
    age = models.IntegerField(null=True)
    nationality = models.IntegerField(default=-1, null=True)
    id_type = models.CharField(choices=ID_TYPE, max_length=50, default='none')
    id_number = models.CharField(max_length=50)
    employment = models.CharField(
        choices=EMPLOYMENT, max_length=45, default='none')
    other_employment = models.CharField(max_length=255, blank=True, null=True)

    mode_of_transport = models.CharField(
        choices=TRANSPORT_MODE, max_length=30, default='none')
    name_of_transport = models.CharField(max_length=30)
    seat_no = models.CharField(max_length=30, null=True)
    arrival_date = models.DateField(verbose_name="Arrival Date")
    point_of_entry = models.ForeignKey(
        PointOfEntry, on_delete=models.DO_NOTHING)

    visiting_purpose = models.CharField(
        choices=PURPOSE, max_length=45, default='none')  # to look around
    other_purpose = models.TextField(null=True)
    duration_of_stay = models.PositiveIntegerField(default=0, null=True)
    location_origin = models.ForeignKey(Location, on_delete=models.DO_NOTHING)

    physical_address = models.TextField(null=True)
    hotel_name = models.CharField(max_length=255, null=True)
    region_id = models.IntegerField(default=-1, null=True)  # to look around
    district_id = models.IntegerField(default=-1, null=True)  # to look around
    street_or_ward = models.CharField(
        max_length=100, null=True)  # to look around
    phone = models.CharField(max_length=25, default='None')
    email = models.EmailField(max_length=255, default='None')

    temp = models.FloatField(null=True)
    disease_to_screen = models.CharField(max_length=150, default='0')
    action_taken = models.CharField(max_length=100, default='None')
    other_symptoms = models.TextField(null=True)
    accept = models.IntegerField(default=0, null=True)
    updated_at = models.DateTimeField("Updated At Date", null=True)

    class Meta(BaseModel.Meta):
        db_table = "et_travellers"

    def __str__(self):
        return self.id


# Traveller visited area
class TravellerVisitedArea(models.Model):
    """A class to create traceller visited areas table."""
    traveller = models.ForeignKey(Traveller, on_delete=models.PROTECT)
    location = models.ForeignKey(Location, on_delete=models.DO_NOTHING)
    location_visited = models.CharField(max_length=250, null=True)
    date = models.DateField(verbose_name="Date", null=True)
    days = models.PositiveIntegerField(null=True)

    class Meta:
        db_table = "et_traveller_visited_areas"

    def __str__(self):
        return self.location


# Traveller symptoms
class TravellerSymptom(models.Model):
    """A class to create traveller symptoms table."""
    traveller = models.ForeignKey(Traveller, on_delete=models.PROTECT)
    symptom = models.ForeignKey(Symptom, on_delete=models.DO_NOTHING)

    class Meta:
        db_table = "et_traveller_symptoms"
