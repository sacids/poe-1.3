from django import forms
from datetime import date, timedelta
from .models import Location, PointOfEntry, Symptom

BLANK_CHOICE = ((0, '-- Select --'),)

SEX = (
    ('', "-- Select --"),
    ('M', "Male"),
    ('F', "Female"),
)

TRANSPORT_MODE = (
    ('', "-- Select --"),
    ('flight', 'Flight'),
    ('vehicle', 'Vehicle'),
    ('vessel', 'Vessel'),
)
PURPOSE = (
    ('', "-- Select --"),
    ('resident', 'Resident'),
    ('tourist', 'Tourist'),
    ('transit', 'Transit'),
    ('business', 'Business'),
)
EMPLOYMENT = (
    ('', "-- Select --"),
    ('government', 'Government'),
    ('non-government', 'Non-Government'),
    ('non-profit', 'Non-Profit'),
    ('student', 'Student'),
    ('business', 'Business'),
    ('religious', 'Religious'),
    ('farmers', 'Farmer'),
)


# Traveller
class TravellerForm(forms.Form):
    full_name = forms.CharField(
        label='Traveller Name (Three names [3])',
        widget=forms.TextInput(attrs={'class': 'form-control', 'id': 'full_name', 'placeholder': "Write full name..."}),
        required=True)

    age = forms.CharField(
        label='Age (in years)',
        widget=forms.TextInput(attrs={'class': 'form-control', 'id': 'age', 'type': 'number', 'min': 1, 'max': 120,
                                      'placeholder': 'Write age...'}), required=True)

    sex = forms.ChoiceField(label="Sex",
                            choices=SEX,
                            widget=forms.Select(attrs={'class': 'form-control', 'id': 'sex'}), required=True)

    nationality = forms.ModelChoiceField(queryset=Location.objects.filter(parent=0), empty_label='-- Select--',
                                         widget=forms.Select(attrs={'class': 'form-control', 'id': 'nationality'}),
                                         required=True)  # todo: review it

    id_number = forms.CharField(label='Passport Number',
                                widget=forms.TextInput(
                                    attrs={'class': 'form-control', 'id': 'id_number',
                                           'placeholder': 'Write passport number...'}), required=True)

    arrival_date = forms.DateField(label='Arrival Date', widget=forms.DateInput(
        attrs={'type': 'date', 'class': 'form-control', 'id': 'arrival_date', 'min': date.today(),
               'max': date.today() + timedelta(days=5)}), required=True)

    mode_of_transport = forms.ChoiceField(label='Mode of Transport', choices=TRANSPORT_MODE, widget=forms.Select(
        attrs={'class': 'form-control', 'id': 'mode_of_transport', 'onChange': 'suggest_point_of_entries()'}),
                                          required=True)

    point_of_entry = forms.ModelChoiceField(queryset=PointOfEntry.objects.all(), empty_label='-- Select--',
                                            widget=forms.Select(
                                                attrs={'class': 'form-control', 'id': 'point_of_entry'}), required=True)

    name_of_transport = forms.CharField(label='Vessel/Flight/Vehicle Name/No', widget=forms.TextInput(
        attrs={'class': 'form-control', 'id': 'name_of_transport',
               'placeholder': 'Write Vessel/Flight/Vehicle Name...'}), required=True)

    seat_no = forms.CharField(label='Seat Number', widget=forms.TextInput(
        attrs={'class': 'form-control', 'id': 'seat_no', 'placeholder': 'Write your seat number...'}), required=False)

    # tab 2
    visiting_purpose = forms.ChoiceField(label='Visiting Purpose', choices=PURPOSE,
                                         widget=forms.Select(attrs={'class': 'form-control', 'id': 'visiting_purpose'}),
                                         required=True)

    other_purpose = forms.CharField(label='Other Purposes (If any)', widget=forms.Textarea(
        attrs={'class': 'form-control', 'id': 'other_purpose', 'rows': 3,
               'placeholder': 'Write other visiting purpose, if any )'}), required=False)

    duration_of_stay = forms.CharField(label='Duration of stay (In days)', widget=forms.TextInput(
        attrs={'class': 'form-control', 'id': 'duration_of_stay', 'type': 'number', 'min': 1,
               'placeholder': 'Write duration of stay...'}), required=False)

    employment = forms.ChoiceField(label='Employment/Occupation', choices=EMPLOYMENT,
                                   widget=forms.Select(attrs={'class': 'form-control', 'id': 'employment'}),
                                   required=False)

    other_employment = forms.CharField(label='Other Employment (If any)', widget=forms.Textarea(
        attrs={'class': 'form-control', 'id': 'other_employment', 'rows': 3,
               'placeholder': 'Write other employment...'}), required=False)

    # tab 3
    physical_address = forms.CharField(label='Physical address', widget=forms.Textarea(
        attrs={'class': 'form-control', 'id': 'physical_address', 'rows': 3,
               'placeholder': 'Write address...'}), required=False)

    hotel_name = forms.CharField(label='Hotel Name', widget=forms.TextInput(
        attrs={'class': 'form-control', 'id': 'hotel_name', 'placeholder': 'Write hotel name...'}), required=False)

    region_id = forms.ModelChoiceField(label='Region',
                                       queryset=Location.objects.filter(code="TZR"), empty_label='-- Select --',
                                       widget=forms.Select(
                                           attrs={'class': 'form-control', 'id': 'region_id',
                                                  'onChange': 'suggest_districts()'}))

    district_id = forms.ModelChoiceField(label='District', queryset=Location.objects.filter(code="TZD"), empty_label='-- Select --',
                                         widget=forms.Select(attrs={'class': 'form-control', 'id': 'district_id'}),
                                         required=False)

    street_or_ward = forms.CharField(label='Street/Ward', widget=forms.TextInput(
        attrs={'class': 'form-control', 'id': 'street_or_ward', 'placeholder': 'Write street or ward...'}),
                                     required=False)

    phone = forms.CharField(label='Phone', widget=forms.TextInput(
        attrs={'class': 'form-control', 'id': 'phone', 'placeholder': 'Write phone...'}), required=True)

    email = forms.CharField(label='Email', widget=forms.EmailInput(
        attrs={'class': 'form-control', 'id': 'email',
               'placeholder': 'Write email address...',
               'onkeyup': "this.value.toLowerCase()"}), required=True)

    # tab 4
    location_origin = forms.ModelChoiceField(label='Country where journey started',
                                             queryset=Location.objects.filter(parent=0), empty_label='-- Select --',
                                             widget=forms.Select(
                                                 attrs={'class': 'form-control', 'id': 'location_origin'}))

    location = forms.ModelChoiceField(label='Country', queryset=Location.objects.filter(parent=0),
                                      empty_label='-- Select --',
                                      widget=forms.Select(
                                          attrs={'class': 'form-control', 'id': 'location'}), required=False)

    location_visited = forms.CharField(label='Location/Province', widget=forms.TextInput(
        attrs={'class': 'form-control', 'id': 'location_visited',
               'placeholder': 'Write location/province visited...'}), required=False)

    date = forms.DateField(label='Date', widget=forms.DateInput(
        attrs={'type': 'date', 'class': 'form-control', 'max': date.today(), 'min': date.today() - timedelta(days=21)}),
                           required=False)

    days = forms.CharField(label='Number of days', widget=forms.TextInput(
        attrs={'class': 'form-control', 'id': 'days', 'placeholder': 'Write number of days...',
               'type': 'number', 'min': 1, 'max': 21}), required=False)

    # tab 5
    symptoms = forms.MultipleChoiceField(widget=forms.CheckboxSelectMultiple(
        attrs={'id': 'symptoms'}), choices=Symptom.objects.all().values_list("id", "title"))

    other_symptoms = forms.CharField(label='Other Symptoms (comma separated)', widget=forms.Textarea(
        attrs={'class': 'form-control', 'id': 'other_symptoms', 'rows': 3,
               'placeholder': 'Write other symptoms...'}), required=False)
