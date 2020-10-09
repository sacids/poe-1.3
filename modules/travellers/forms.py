from django.utils.translation import ugettext_lazy as _
from django import forms
from .models import Location, PointOfEntry, Traveller


# Traveller
class TravellerForm(forms.ModelForm):
    """
    A class to create traveller form.
    """
    class Meta:
        model = Traveller
        exclude = ('active',)
        fields = ('__all__')
        widgets = {
            'surname': forms.TextInput(attrs={'class':'form-control', 'placeholder': 'Write surname...',}),
        
        }

        labels = {
            'surname': _('Surname'),
            'other_names': _('Other Names'),
            'age_category': _('Age Category'),
            'age': _('Age <span id="age_cat"></span>'),
            'sex': _('Sex'),
            'nationality': _('Nationality'),
            'passport_number': _('Passport Number'),
            'arrival_date': _('Arrival Date'),
            'mode_of_transport': _('Mode of Transport'), 
            'point_of_entry': _('Point of Entry'), 
            'name_of_transport': _('Vessel/Flight/Vehicle Name/No'),
            'seat_number': _('Seat Number'),  
        }
        