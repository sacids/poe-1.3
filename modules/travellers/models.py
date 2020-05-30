from django.db import models
from phone_field import PhoneField
from modules.screening.models import Conditions
from modules.common.models import BaseModel


SEX = (
    ('none', "--Select--"),
    ('male', "MALE"),
    ('female', "FEMALE"),
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


class InternationalTraveller(BaseModel):
    full_name = models.CharField(max_length=250)
    sex = models.CharField(choices=SEX, max_length=15, default='none')
    age = models.PositiveIntegerField()
    passport_no = models.CharField(max_length=250)
    vehicle_flight_vehicle = models.CharField(max_length=250)
    nationality = models.CharField(max_length=150, default='Tanzania') # to look around
    mode_of_transport = models.CharField(choices=TRANSPORT_MODE, max_length=30, default='none') # to look around
    arrival_date = models.DateField(verbose_name="Arrival Date")
    seat_no = models.CharField(max_length=30)
    point_of_entry = models.CharField(max_length=250)  # to look around

    visit_purpose = models.CharField(choices=PURPOSE, max_length=45, default='none') # to look around
    other_purpose = models.TextField()
    duration_for_stay = models.PositiveIntegerField()
    employment = models.CharField(choices=EMPLOYMENT, max_length=45, default='none')
    other_employment = models.CharField(max_length=255)

    physical_address = models.TextField()
    hotel_name = models.CharField(max_length=255)
    region = models.CharField(max_length=255) # to look around
    district = models.CharField(max_length=255) # to look around
    street_or_ward = models.CharField(max_length=255) # to look around
    phone_number = PhoneField(null=True, help_text='Contact Phone Number')
    email_address = models.EmailField(max_length=255)

    country_journey_started = models.CharField(max_length=250, default='Tanzania') # to look around

    class Meta(BaseModel.Meta):
        db_table = 'international_traveller'

    def __str__(self):
        return self.full_name


class InternationalTravellerExt(BaseModel):
    international_traveller = models.ForeignKey(InternationalTraveller, on_delete=models.PROTECT, default=None)
    country = models.CharField(max_length=150, default='Tanzania') # to look around
    location_visited = models.CharField(max_length=250)
    date = models.DateField(verbose_name="Date")
    days = models.PositiveIntegerField()

    class Meta(BaseModel.Meta):
        db_table = 'international_traveller_ext'

    def __str__(self):
        return f'{self.international_traveller}'


class TravellerSymptom(BaseModel):
    condition = models.ForeignKey(Conditions, on_delete=models.PROTECT, default=None)

    class Meta(BaseModel.Meta):
        db_table = 'traveller_conditions'

    def __str__(self):
        return f'{self.condition}'

