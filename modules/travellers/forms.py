from django.utils import translation
from django.conf import settings
from django.utils.translation import ugettext_lazy as _
from django import forms
from datetime import date, timedelta
from .models import Location, PointOfEntry, Symptom

BLANK_CHOICE = (('', _('-- Select --')),)

SEX = (
    ('', _('-- Select --')),
    ('M', _('Male')),
    ('F', _('Female')),
)

TRANSPORT_MODE = (
    ('', _('-- Select --')),
    ('flight', _('Flight')),
    ('vehicle', _('Vehicle')),
    ('vessel', _('Vessel')),
    ('train', _('Train')),
)
PURPOSE = (
    ('', _('-- Select --')),
    ('resident', _('Resident')),
    ('tourist', _('Tourist')),
    ('transit', _('Transit')),
    ('business', _('Business')),
)
EMPLOYMENT = (
    ('', _('-- Select --')),
    ('government', _('Government')),
    ('non-government', _('Non-Government')),
    ('non-profit', _('Non-Profit')),
    ('student', _('Student')),
    ('business', _('Business')),
    ('religious', _('Religious')),
    ('farmers', _('Farmer')),
)


# Traveller
class TravellerForm(forms.Form):
    """
    A class to create traveller form.

    """

    full_name = forms.CharField(
        label=_('Traveller Name (Three names [3])'),
        widget=forms.TextInput(attrs={
                               'class': 'form-control', 'id': 'full_name', 'placeholder': _('Write full name...')}),
        required=True)

    age = forms.CharField(
        label=_('Age (in years)'),
        widget=forms.TextInput(attrs={'class': 'form-control', 'id': 'age', 'type': 'number', 'min': 1, 'max': 120,
                                      'placeholder': _('Write age...')}), required=True)

    sex = forms.ChoiceField(label=_("Sex"),
                            choices=SEX,
                            widget=forms.Select(attrs={'class': 'form-control', 'id': 'sex'}), required=True)

    nationality = forms.ModelChoiceField(label=_('Nationality'), queryset=Location.objects.filter(parent=0), empty_label=_('-- Select --'),
                                         widget=forms.Select(
                                             attrs={'class': 'form-control', 'id': 'nationality'}),
                                         required=True)  # todo: review it

    id_number = forms.CharField(label=_('Passport Number'),
                                widget=forms.TextInput(
                                    attrs={'class': 'form-control', 'id': 'id_number',
                                           'placeholder': _('Write passport number...')}), required=True)

    arrival_date = forms.DateField(label=_('Arrival Date'), widget=forms.DateInput(
        attrs={'type': 'date', 'class': 'form-control', 'id': 'arrival_date', 'min': date.today(),
               'max': date.today() + timedelta(days=2)}), required=True)

    mode_of_transport = forms.ChoiceField(label=_('Mode of Transport'), choices=TRANSPORT_MODE, widget=forms.Select(
        attrs={'class': 'form-control', 'id': 'mode_of_transport', 'onChange': 'suggest_point_of_entries()'}),
        required=True)

    point_of_entry = forms.ModelChoiceField(label=_('Point of Entry'), queryset=PointOfEntry.objects.all(), empty_label=_('-- Select --'),
                                            widget=forms.Select(
                                                attrs={'class': 'form-control', 'id': 'point_of_entry'}), required=True)

    name_of_transport = forms.CharField(label=_('Vessel/Flight/Vehicle Name/No'), widget=forms.TextInput(
        attrs={'class': 'form-control', 'id': 'name_of_transport',
               'placeholder': _('Write Vessel/Flight/Vehicle Name...')}), required=True)

    seat_no = forms.CharField(label=_('Seat Number'), widget=forms.TextInput(
        attrs={'class': 'form-control', 'id': 'seat_no', 'placeholder': _('Write your seat number...')}), required=False)

    # tab 2
    visiting_purpose = forms.ChoiceField(label=_('Visiting Purpose'), choices=PURPOSE,
                                         widget=forms.Select(
                                             attrs={'class': 'form-control', 'id': 'visiting_purpose'}),
                                         required=False)

    other_purpose = forms.CharField(label=_('Other Purposes (If any)'), widget=forms.Textarea(
        attrs={'class': 'form-control', 'id': 'other_purpose', 'rows': 3,
               'placeholder': _('Write other visiting purpose, if any )')}), required=False)

    duration_of_stay = forms.CharField(label=_('Duration of stay (In days)'), widget=forms.TextInput(
        attrs={'class': 'form-control', 'id': 'duration_of_stay', 'type': 'number', 'min': 1,
               'placeholder': _('Write duration of stay...')}), required=False)

    employment = forms.ChoiceField(label=_('Employment/Occupation'), choices=EMPLOYMENT,
                                   widget=forms.Select(
                                       attrs={'class': 'form-control', 'id': 'employment'}),
                                   required=False)

    other_employment = forms.CharField(label=_('Other Employment (If any)'), widget=forms.Textarea(
        attrs={'class': 'form-control', 'id': 'other_employment', 'rows': 3,
               'placeholder': _('Write other employment...')}), required=False)

    # tab 3
    physical_address = forms.CharField(label=_('Physical address'), widget=forms.Textarea(
        attrs={'class': 'form-control', 'id': 'physical_address', 'rows': 3,
               'placeholder': _('Write address...')}), required=False)

    hotel_name = forms.CharField(label=_('Hotel Name'), widget=forms.TextInput(
        attrs={'class': 'form-control', 'id': 'hotel_name', 'placeholder': _('Write hotel name...')}), required=False)

    region_id = forms.ModelChoiceField(label=_('Region'),
                                       queryset=Location.objects.filter(code="TZR"), empty_label=_('-- Select --'),
                                       widget=forms.Select(
                                           attrs={'class': 'form-control', 'id': 'region_id',
                                                  'onChange': 'suggest_districts()'}))

    district_id = forms.ModelChoiceField(label=_('District'), queryset=Location.objects.filter(code="TZD"), empty_label=_('-- Select --'),
                                         widget=forms.Select(
                                             attrs={'class': 'form-control', 'id': 'district_id'}),
                                         required=False)

    street_or_ward = forms.CharField(label=_('Street/Ward'), widget=forms.TextInput(
        attrs={'class': 'form-control', 'id': 'street_or_ward', 'placeholder': _('Write street or ward...')}),
        required=False)

    phone = forms.CharField(label=_('Phone'), widget=forms.TextInput(
        attrs={'class': 'form-control', 'id': 'phone', 'placeholder': _('Write phone...')}), required=True)

    email = forms.CharField(label=_('Email'), widget=forms.EmailInput(
        attrs={'class': 'form-control', 'id': 'email',
               'placeholder': _('Write email address...'),
               'onkeyup': "this.value.toLowerCase()"}), required=False)

    # tab 4
    location_origin = forms.ModelChoiceField(label=_('Country where journey started'),
                                             queryset=Location.objects.filter(parent=0), empty_label=_('-- Select --'),
                                             widget=forms.Select(
                                                 attrs={'class': 'form-control', 'id': 'location_origin'}))

    location = forms.ModelChoiceField(label=_('Country'), queryset=Location.objects.filter(parent=0),
                                      empty_label=_('-- Select --'),
                                      widget=forms.Select(
                                          attrs={'class': 'form-control', 'id': 'location'}), required=False)

    location_visited = forms.CharField(label=_('Location/Province'), widget=forms.TextInput(
        attrs={'class': 'form-control', 'id': 'location_visited',
               'placeholder': _('Write location/province visited...')}), required=False)

    date = forms.DateField(label=_('Date'), widget=forms.DateInput(
        attrs={'type': 'date', 'class': 'form-control', 'max': date.today(), 'min': date.today() - timedelta(days=21)}),
        required=False)

    days = forms.CharField(label=_('Number of days'), widget=forms.TextInput(
        attrs={'class': 'form-control', 'id': 'days', 'placeholder': _('Write number of days...'),
               'type': 'number', 'min': 1, 'max': 21}), required=False)

    # tab 5
    # symptoms = forms.MultipleChoiceField(widget=forms.CheckboxSelectMultiple(
    #     attrs={'id': 'symptoms'}), choices=Symptom.objects.all().values_list('id', 'title'))

    other_symptoms = forms.CharField(label=_('Other Symptoms (comma separated)'), widget=forms.Textarea(
        attrs={'class': 'form-control', 'id': 'other_symptoms', 'rows': 3,
               'placeholder': _('Write other symptoms...')}), required=False)
