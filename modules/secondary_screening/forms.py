from django import forms
from .models import RiskAssessment


class RiskAssessmentForm(forms.ModelForm):
    class Meta:
        model = RiskAssessment
        fields = ['decision', 'reason', 'other_reason']
