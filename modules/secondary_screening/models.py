from django.db import models
from modules.travellers.models import Disease, Symptom, Traveller
from django.contrib.auth.models import User
from multiselectfield import MultiSelectField

# Create your models here.
ANSWER = (
    ('yes', 'Yes'),
    ('no', 'No'),
    ('unknown', 'Unknown'),
)

QN_CAT = (
    ('SELECT', 'Multiple Choice'),
    ('TEXTAREA', 'Free Form'),
    ('CHECKBOX', 'Check Box'),
)

DECISION = {
    ('Allowed', 'Allowed to Proceed with entry/Exit formalities'),
    ('Conditional', 'Allowed to proceed with condition'),
    ('Denied', 'Denied /Delayed Travel'),
}

REASON = {
    ('NOT RELATED',
     'Illness not related to PRIORITY DISEASE and the traveler obtain medical care at PoE and can continue with travel'),
    ('LOW EXPOSURE',
     'Exposure to PRIORITY DISEASE is low and the traveler can continue travelling while self-monitoring'),
    ('SUSPECT CASE',
     'Moved to Holding Facility because met the criteria for Suspect Case of PRIORITY DISEASE (complete contact listing form'),
    ('HIGH RISK CONTACT',
     'Referred to contact tracing because met the criteria for high risk contact'),
    ('REFERRAL',
     'Referred to a nearby health facility because the Illness is not related to PRIORITY DISEASE and require other treatment'),
    ('LABORATORY TESTING',
     'Waiting for Laboratory specimen taken and sent to laboratory for testing for PRIORITY DISEASE'),
    ('OTHER', 'Other'),
}


# decisions
class Decision(models.Model):
    title = models.TextField

    class Meta:
        db_table = 'ss_decisions'

    def __str__(self):
        return self.title


# decision reasons
class DecisionReason(models.Model):
    title = models.TextField

    class Meta:
        db_table = 'ss_decision_reasons'

    def __str__(self):
        return self.title


# risk factors
class RiskFactor(models.Model):
    disease = models.ForeignKey(Disease, on_delete=models.PROTECT)
    factor = models.TextField
    parent = models.PositiveIntegerField

    class Meta:
        db_table = 'ss_risk_factors'

    def __str__(self):
        return self.factor


# traveller symptoms
class ScreeningTravellerSymptom(models.Model):
    traveller = models.ForeignKey(Traveller, on_delete=models.CASCADE)
    symptom = models.ForeignKey(Symptom, on_delete=models.DO_NOTHING)

    class Meta:
        db_table = 'ss_traveller_symptoms'

    def __str__(self):
        return self.traveller.surname


# traveller decision taken
class TravellerDecisionTaken(models.Model):
    traveller = models.ForeignKey(Traveller, on_delete=models.CASCADE)
    decision = models.ForeignKey(Decision, on_delete=models.DO_NOTHING)
    created_by = models.PositiveIntegerField
    created_at = models.DateTimeField("Created At Date")

    class Meta:
        db_table = 'ss_traveller_decision_taken'

    def __str__(self):
        return self.traveller.surname


# traveller decision reasons
class TravellerDecisionReason(models.Model):
    traveller = models.ForeignKey(Traveller, on_delete=models.CASCADE)
    reason = models.ForeignKey(DecisionReason, on_delete=models.DO_NOTHING)

    class Meta:
        db_table = 'ss_traveller_decision_reasons'

    def __str__(self):
        return self.traveller.surname


# traveller risk factors
class TravellerRiskFactor(models.Model):
    traveller = models.ForeignKey(Traveller, on_delete=models.CASCADE)
    risk_factor = models.ForeignKey(RiskFactor, on_delete=models.DO_NOTHING)
    answer = models.CharField(choices=ANSWER, max_length=50, default='unknown')

    class Meta:
        db_table = 'ss_traveller_risk_factors'

    def __str__(self):
        return self.traveller.surname


class DiseaseSurveyQns(models.Model):
    disease = models.ForeignKey(Disease, on_delete=models.CASCADE)
    title = models.TextField()
    category = models.CharField(choices=QN_CAT, max_length=50, default='MC')

    class Meta:
        db_table = 'ss_disease_survey_qns'
        verbose_name_plural = 'Disease Survey Questions'

    def __str__(self):
        return self.title


class DiseaseSurveyAns(models.Model):
    disease = models.ForeignKey(Disease, on_delete=models.CASCADE)
    traveller = models.ForeignKey(Traveller, on_delete=models.CASCADE)
    question = models.ForeignKey(DiseaseSurveyQns, on_delete=models.CASCADE)
    title = models.TextField()

    class Meta:
        db_table = 'ss_disease_survey_ans'
        verbose_name_plural = 'Disease Survey Answers'

    def __str__(self):
        return self.title


class RiskAssessment(models.Model):
    traveller = models.ForeignKey(Traveller, on_delete=models.CASCADE)
    decision = models.CharField(choices=DECISION, max_length=50, default='Denied')
    reason = MultiSelectField(choices=REASON)
    other_reason = models.TextField(blank=True)
    user = models.ForeignKey(User, on_delete=models.PROTECT)

    class Meta:
        db_table = 'ss_risk_assessment'
        verbose_name_plural = 'Risks Assessment'

    def __str__(self):
        return self.decision
