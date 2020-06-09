from django.db import models
from modules.travellers.models import Disease, Symptom, Traveller
from django.contrib.auth.models import User
from django.forms import ModelForm

# Create your models here.
ANSWER = (
    ('yes', "Yes"),
    ('no', "No"),
    ('unknown', "Unknown"),
)

QN_CAT = (
    ('MC',"Multiple Choice"),
    ('FF',"Free Form"),
)

DECISION    = {
    ('Allowed','Allowed to Proceed with entry/Exit formalities'),
    ('Conditional','Allowed to proceed with condition'),
    ('Denied','Denied /Delayed Travel'),
}

REASON      = {
    ('NOT RELATED','Illness not related to PRIORITY DISEASE and the traveler obtain medical care at PoE and can continue with travel'),
    ('LOW EXPOSURE','Exposure to PRIORITY DISEASE is low and the traveler can continue travelling while self-monitoring'),
    ('SUSPECT CASE','Moved to Holding Facility because met the criteria for Suspect Case of PRIORITY DISEASE (complete contact listing form'),
    ('HIGH RISK CONTACT','Referred to contact tracing because met the criteria for high risk contact'),
    ('REFERRAL','Referred to a nearby health facility because the Illness is not related to PRIORITY DISEASE and require other treatment'),
    ('LABORATORY TESTING','Waiting for Laboratory specimen taken and sent to laboratory for testing for PRIORITY DISEASE'),
    ('OTHER','Other'),
}

# decisions
class Decision(models.Model):
    title = models.TextField

    class Meta:
        db_table = "ss_decisions"


# decision reasons
class DecisionReason(models.Model):
    title = models.TextField

    class Meta:
        db_table = "ss_decision_reasons"


# risk factors
class RiskFactor(models.Model):
    disease = models.ForeignKey(Disease, on_delete=models.PROTECT)
    factor = models.TextField
    parent = models.PositiveIntegerField

    class Meta:
        db_table = "ss_risk_factors"


# traveller symptoms
class ScreeningTravellerSymptom(models.Model):
    traveller = models.ForeignKey(Traveller, on_delete=models.CASCADE)
    symptom = models.ForeignKey(Symptom, on_delete=models.DO_NOTHING)

    class Meta:
        db_table = "ss_traveller_symptoms"


# traveller decision taken
class TravellerDecisionTaken(models.Model):
    traveller = models.ForeignKey(Traveller, on_delete=models.CASCADE)
    decision = models.ForeignKey(Decision, on_delete=models.DO_NOTHING)
    created_by = models.PositiveIntegerField
    created_at = models.DateTimeField("Created At Date")

    class Meta:
        db_table = "ss_traveller_decision_taken"


# traveller decision reasons
class TravellerDecisionReason(models.Model):
    traveller = models.ForeignKey(Traveller, on_delete=models.CASCADE)
    reason = models.ForeignKey(DecisionReason, on_delete=models.DO_NOTHING)

    class Meta:
        db_table = "ss_traveller_decision_reasons"


# traveller risk factors
class TravellerRiskFactor(models.Model):
    traveller = models.ForeignKey(Traveller, on_delete=models.CASCADE)
    risk_factor = models.ForeignKey(RiskFactor, on_delete=models.DO_NOTHING)
    answer = models.CharField(choices=ANSWER, max_length=50, default='unknown')

    class Meta:
        db_table = "ss_traveller_risk_factors"

class DiseaseSurveyQns(models.Model):
    disease         = models.ForeignKey(Disease, on_delete=models.CASCADE)
    title           = models.TextField()
    category        = models.CharField(choices=QN_CAT, max_length=50, default='MC')

    class Meta:
        db_table = "ss_disease_survey_qns"

    def __str__(self):
        return self.title

class DiseaseSurveyAns(models.Model):
    disease         = models.ForeignKey(Disease, on_delete=models.CASCADE)
    traveller       = models.ForeignKey(Traveller, on_delete=models.CASCADE)
    question        = models.ForeignKey(DiseaseSurveyQns, on_delete=models.CASCADE)
    title           = models.TextField()

    class Meta:
        db_table = "ss_disease_survey_ans"

    def __str__(self):
        return self.title

class RiskAssessment(models.Model):
    traveller       = models.ForeignKey(Traveller, on_delete=models.CASCADE)
    decision        = models.CharField(choices=DECISION, max_length=50, default='MC')
    reason          = models.CharField(choices=REASON, max_length=50, default='MC')
    other_reason    = models.TextField()
    user            = models.ForeignKey(User, on_delete=models.PROTECT)

    class Meta:
        db_table = "ss_risk_assessment"

    #def __str__(self):
     #   return self.traveller


