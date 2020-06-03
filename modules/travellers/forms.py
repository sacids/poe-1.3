from django import forms
from .models import Traveller


class TravellerForm(forms.ModelForm):
    class Meta:
        model = Traveller
        fields = ('full_name', 'sex', 'age', 'id_type', 'id_number',
                  'employment', 'other_employment')
        exclude = ('type',)


