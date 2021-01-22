from os import name
from django.db import models
from django.db.models.deletion import DO_NOTHING
from modules.common.models import BaseModel
from django.contrib.auth.models import User
from django.forms.models import model_to_dict
from django.utils.translation import ugettext_lazy as _
import uuid

FORM_CATEGORY = (
    ('arrival', 'ARRIVAL'),
    ('departure', 'DEPARTURE'),
)

AGE_CATEGORY = (
    ('', _('-- Select --')),
    ('above', 'ABOVE 1'),
    ('below', 'BELOW 1'),
)

SEX = (
    ('', _('-- Select --')),
    ('M', 'Male'),
    ('F', 'Female'),
)
ACTIVE = (
    ('1', '1'),
    ('0', '0'),
)
ID_TYPE = (
    ('passport-number', 'PASSPORT NUMBER'),
    ('national-id', 'NATIONAL ID'),
    ('voter-id', 'VOTER ID'),
)
TRANSPORT_MODE = (
    ('', _('-- Select --')),
    ('flight', 'Flight'),
    ('truck', 'Truck'),
    ('bus', 'Bus'),
    ('vehicle', 'Vehicle'),
    ('vessel', 'Vessel'),
    ('train', 'Train'),
    ('by-foot', 'By Foot'),
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
    ('', _('-- Select --')),
    ('resident', 'Resident'),
    ('tourist', 'Tourist'),
    ('diplomat', 'Diplomat'),
    ('transit', 'Transit'),
    ('business', 'Business'),
    ('conference', 'Conference'),
    ('studies', 'Studies'),
    ('other', 'Other'),
)
EMPLOYMENT = (
    ('', _('-- Select --')),
    ('student', 'Student'),
    ('religious', 'Religious'),
    ('farmer', 'Farmer'),
    ('hunter', 'Hunter'),
    ('nurse', 'Nurse'),
    ('clinician', 'Clinician'),
    ('engineer', 'Engineer'),
    ('sports', 'Sports'),
    ('business', 'Business'),
    ('other', 'Other'),
)

ACTION_TAKEN = (
    ('Allowed', 'Allowed to Proceed with entry/Exit formalities'),
    ('Screening', 'Sent to secondary screening'),
)


# diseases
class Disease(models.Model):
    """A class to create disease table."""
    title = models.CharField(max_length=50)

    def __str__(self):
        return self.title

    class Meta:
        db_table = 'et_diseases'
        verbose_name_plural = 'Diseases'


# symptoms
class Symptom(models.Model):
    """A class to create symptoms table."""
    title = models.CharField(max_length=150)
    title_sw = models.CharField(max_length=150, null=True)
    alias = models.CharField(max_length=150, null=True)

    class Meta:
        db_table = 'et_symptoms'
        verbose_name_plural = 'Symptoms'

    def __str__(self):
        return self.title


class DiseaseSymptom(models.Model):
    """A class to create disease symptoms table."""
    disease = models.ForeignKey(Disease, on_delete=models.PROTECT)
    symptom = models.ForeignKey(Symptom, on_delete=models.PROTECT)
    score = models.PositiveIntegerField()

    class Meta:
        db_table = 'et_disease_symptoms'
        verbose_name_plural = 'Disease Symptoms'

    def __str__(self):
        return self.disease.title


# locations
class Location(models.Model):
    """A class to create location table."""
    title = models.CharField(max_length=100)
    code = models.CharField(max_length=10, null=True)
    parent = models.PositiveIntegerField()
    calling_code = models.CharField(
        max_length=5, null=True, verbose_name="Calling code")

    class Meta:
        db_table = 'et_locations'
        verbose_name_plural = 'Locations'

    def __str__(self):
        return str(self.title)


class ScreenCriteria(models.Model):
    """A class to create screening criteria table."""
    disease = models.ForeignKey(Disease, on_delete=models.PROTECT)
    countries = models.ManyToManyField(
        Location, related_name='countries', blank=True)
    symptoms = models.ManyToManyField(
        Symptom, related_name='symptoms', blank=True)
    temp = models.CharField(max_length=250, blank=True, null=True)
    active = models.CharField(choices=ACTIVE, max_length=1, default='0')

    class Meta:
        db_table = 'et_ss_criteria'
        verbose_name_plural = 'Screening Criteria'

    def __str__(self):
        return self.disease.title


class LocationDisease(models.Model):
    """A class to create location diseases table."""
    location = models.ForeignKey(Location, on_delete=models.PROTECT)
    disease = models.ForeignKey(Disease, on_delete=models.PROTECT)
    score = models.PositiveIntegerField()

    class Meta:
        db_table = "et_location_diseases"

    def __str__(self):
        return self.location.title


# point of entries
class PointOfEntry(models.Model):
    """A class to create point of entries table."""
    title = models.CharField(max_length=100)
    code = models.CharField(max_length=100, null=True, blank=True)
    mode_of_transport = models.CharField(
        choices=TRANSPORT_MODE, max_length=255, null=True, blank=True)
    category = models.CharField(
        choices=TRANSPORT_CATEGORY, max_length=50, null=True, blank=True)
    agents = models.ManyToManyField(User, blank=True)

    class Meta:
        db_table = 'et_point_of_entries'
        verbose_name_plural = 'Point of Entries'

    def __str__(self):
        return self.title


# action taken
class ActionTaken(models.Model):
    title = models.CharField(max_length=255, null=False)
    description = models.TextField(null=True)

    class Meta:
        db_table = 'et_action_taken'
        verbose_name_plural = 'Action Taken'

    def __str__(self):
        return self.title


# travellers
class Traveller(BaseModel):
    """A class to create travellers table."""
    id = models.UUIDField(primary_key=True, default=uuid.uuid4,
                          unique=True, editable=False)
    surname = models.CharField("Write..", max_length=50, null=True)
    other_names = models.CharField(max_length=100, null=True)
    category = models.CharField(
        choices=FORM_CATEGORY, max_length=30, default='None')
    sex = models.CharField(choices=SEX, max_length=15, default='None')
    age_category = models.CharField(
        choices=AGE_CATEGORY, max_length=30, null=True)
    age = models.IntegerField(null=True)
    nationality = models.ForeignKey(
        Location, related_name="nationality", default=0, on_delete=models.DO_NOTHING)
    id_type = models.CharField(choices=ID_TYPE, max_length=50, default='None')
    id_number = models.CharField(max_length=50)
    employment = models.CharField(
        choices=EMPLOYMENT, max_length=50, default='None')
    other_employment = models.CharField(max_length=255, blank=True, null=True)

    mode_of_transport = models.CharField(
        choices=TRANSPORT_MODE, max_length=50, default='None')
    name_of_transport = models.CharField(max_length=50, null=True, blank=True)
    seat_number = models.CharField(max_length=25, null=True, blank=True)
    arrival_date = models.DateField(verbose_name="Arrival Date")
    point_of_entry = models.ForeignKey(
        PointOfEntry, related_name="point_of_entry", on_delete=models.DO_NOTHING)

    visiting_purpose = models.CharField(
        choices=PURPOSE, max_length=50, default='None')  # to look around
    other_purpose = models.TextField(null=True, blank=True)
    duration_of_stay = models.PositiveIntegerField(null=True, blank=True)
    location_origin = models.ForeignKey(
        Location, related_name="location_origin", on_delete=models.DO_NOTHING)

    physical_address = models.TextField(null=True)
    region = models.ForeignKey(Location, related_name="region", default=0,
                               on_delete=models.DO_NOTHING)  # to look around
    district = models.ForeignKey(Location, null=True, blank=True, on_delete=DO_NOTHING)  # to look around
    street_or_ward = models.CharField(
        max_length=100, null=True, blank=True)  # to look around
    phone = models.CharField(max_length=25, null=True, blank=True)
    email = models.EmailField(max_length=255, null=True, blank=True)

    temp = models.FloatField(null=True)
    disease_to_screen = models.CharField(max_length=150, default='0')
    action_taken = models.ForeignKey(
        ActionTaken, default=1, on_delete=models.DO_NOTHING)
    symptoms = models.ManyToManyField(Symptom, blank=True)
    other_symptoms = models.TextField(null=True, blank=True)
    accept = models.IntegerField(default=0, null=True)
    status = models.CharField(max_length=20,default="None", null=True)
    updated_at = models.DateTimeField(verbose_name="Updated date", null=True)

    class Meta(BaseModel.Meta):
        db_table = 'et_travellers'

    def __str__(self):
        return str(self.id)

    def instance(self):
        return model_to_dict(self)


# Traveller visited area
class TravellerVisitedArea(models.Model):
    """A class to create traceller visited areas table."""
    traveller = models.ForeignKey(
        Traveller, related_name="visited_area", on_delete=models.PROTECT, default=1)
    location = models.ForeignKey(Location, on_delete=models.DO_NOTHING)
    location_visited = models.CharField(max_length=250, null=True)
    date = models.DateField(verbose_name="Date", null=True)
    days = models.PositiveIntegerField(null=True)

    class Meta:
        db_table = 'et_traveller_visited_areas'

    def __str__(self):
        return str(self.location)

    def instance(self):
        return model_to_dict(self)


# Traveller symptoms
"""
class TravellerSymptom(models.Model):
    '''A class to create traveller symptoms table.'''
    traveller = models.ForeignKey(Traveller, on_delete=models.PROTECT)
    symptom = models.ForeignKey(Symptom, on_delete=models.DO_NOTHING)

    class Meta:
        db_table = "et_traveller_symptoms"
"""
