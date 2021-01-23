from django.forms.widgets import Textarea
from django.utils.translation import ugettext_lazy as _
from datetime import date, timedelta
from django import forms
from .models import Location, PointOfEntry, Traveller


# Traveller
class TravellerForm(forms.ModelForm):
    """
    A class to create traveller form.
    """

    def __init__(self, *args, **kwargs):
        super(TravellerForm, self).__init__(*args, **kwargs)
        # nationality
        self.fields['nationality'].empty_label    =   _('-- Select --')
        self.fields['nationality'].queryset       =   Location.objects.filter(parent=0).order_by('title')

        #point of entry
        self.fields['point_of_entry'].empty_label = _('-- Select --')

        #region
        self.fields['region'].empty_label         = _('-- Select --')
        self.fields['region'].queryset            = Location.objects.filter(code="TZR").order_by('title')

        #district
        self.fields['district'].empty_label         = _('-- Select --')
        self.fields['district'].queryset            = Location.objects.filter(code="TZD").order_by('title')

        #location
        self.fields['location_origin'].empty_label  = _('-- Select --')
        self.fields['location_origin'].queryset     = Location.objects.filter(parent=0).order_by('title')
       

    class Meta:
        model = Traveller
        exclude = ('active', 'temp', 'category', 'id_type', 'temp', 'disease_to_screen', 'action_taken', 'status', 'updated_at')
        fields = ('__all__')
        widgets = {
            'surname': forms.TextInput(attrs={'class': 'form-control', 'id': 'surname', 'placeholder': _('Write surname...'), }),
            'other_names': forms.TextInput(attrs={'class': 'form-control', 'id': 'other_names', 'placeholder': _('Write other names...'), }),
            'age_category': forms.Select(attrs={'class': 'form-control', 'id': 'age_category'}),
            'age': forms.NumberInput(
                attrs={'class': 'form-control', 'id': 'age', 'min': 1, 'max': 120, 'placeholder': _('Write age...'), }),
            'sex': forms.Select(attrs={'id': 'sex'}),
            'nationality': forms.Select(attrs={'class': 'form-control nationality-select', 'id': 'nationality'}),
            'id_number': forms.TextInput(
                attrs={'class': 'form-control', 'id': 'id_number', 'placeholder': _('Write passport number...'), }),
            'arrival_date': forms.DateInput(
                attrs={'type': 'date', 'class': 'form-control', 'id': 'arrival_date', 'min': date.today(),
                       'max': date.today() + timedelta(days=1)}),
            'mode_of_transport': forms.Select(
                attrs={'class': 'form-control mode-of-transport-select', 'id': 'mode_of_transport',
                       'onChange': 'suggest_point_of_entries()', }),
            'point_of_entry': forms.Select(
                attrs={'class': 'form-control', 'id': 'point_of_entry', }),
            'name_of_transport': forms.TextInput(
                attrs={'class': 'form-control', 'id': 'name_of_transport', 'placeholder': _('Write Vessel/Flight/Vehicle Name...'), }),
            'seat_number': forms.TextInput(
                attrs={'class': 'form-control', 'id': 'seat_number', 'placeholder': _('Write your seat number...'), }),

            'visiting_purpose': forms.Select(attrs={'class': 'form-control visiting-purpose-select', 'id': 'visiting_purpose', }),
            'other_purpose': forms.Textarea(attrs={'class': 'form-control', 'id': 'other_purpose', 'rows': 3,
                                                   'placeholder': _('Write other visiting purpose....')}),
            'duration_of_stay': forms.NumberInput(
                attrs={'class': 'form-control', 'id': 'duration_of_stay', 'placeholder': _('Write duration of stay...'),
                       'min': 1}),
            'employment': forms.Select(attrs={'class': 'form-control employment-select', 'id': 'employment'}),
            'other_employment': forms.Textarea(attrs={'class': 'form-control', 'id': 'other_employment', 'rows': 3,
                                                      'placeholder': _('Write other occupation...')}),

            'physical_address': forms.Textarea(attrs={'class': 'form-control', 'id': 'physical_address', 'rows': 3,
                                                      'placeholder': _('Write physical address/hotel name...')}),
            'region': forms.Select(attrs={'class': 'form-control region-select', 'id': 'region_id',
                                          'onChange': 'suggest_districts()'}),

            'district': forms.Select(attrs={'class': 'form-control', 'id': 'district_id'}),

            'street_or_ward': forms.TextInput(
                attrs={'class': 'form-control', 'id': 'street_or_ward', 'placeholder': _('Write street or ward...')}),
            'phone': forms.TextInput(attrs={'class': 'form-control', 'id': 'phone', 'placeholder': _('Write phone...'),
                                            'onKeyPress': 'checkNumber(event)'}),
            'email': forms.TextInput(attrs={'class': 'form-control', 'id': 'email',
                                            'placeholder': _('Write email address...'),
                                            'onkeyup': "this.value.toLowerCase()"}),

            'location_origin': forms.Select(attrs={'class': 'form-control location-origin-select',
                                                   'id': 'location_origin'}),

            'other_symptoms': forms.Textarea(attrs={'class': 'form-control', 'id': 'other_symptoms', 'rows': 3,
                                                    'placeholder': _('Write other symptoms...')})

        }

        labels = {
            'surname': _('Surname'),
            'other_names': _('Other Names'),
            'age_category': _('Age Category'),
            'age': _('Age <span id="age_cat"></span>'),
            'sex': _('Sex'),
            'nationality': _('Nationality'),
            'id_number': _('Passport Number'),
            'arrival_date': _('Arrival Date'),
            'mode_of_transport': _('Mode of Transport'),
            'point_of_entry': _('Point of Entry'),
            'name_of_transport': _('Vessel/Flight/Vehicle Name/No'),
            'seat_number': _('Seat Number'),
            'visiting_purpose': _('Visiting Purpose'),
            'other_purpose': _('Other Purposes <span id="other_purpose_astr" class="asteriskField"></span>'),
            'duration_of_stay': _('Duration of stay (In days) <span id="dur_stay_astr" class="asteriskField"></span>'),
            'employment': _('Occupation'),
            'other_employment': _('Other occupation <span id="other_employment_astr" class="asteriskField"></span>'),
            'physical_address': _('Physical address/Hotel Name'),
            'region': _('Region'),
            'district': _('District'),
            'street_or_ward': _('Street/Ward'),
            'phone': _('Phone'),
            'email': _('Email'),
            'location_origin': _('Country where journey started'),
            'other_symptoms': _('Other Symptoms (comma separated)')
        }
