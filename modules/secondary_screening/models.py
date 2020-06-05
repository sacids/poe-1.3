from django.db import models
from modules.travellers.models import Disease, Symptom, Traveller

# Create your models here.
ANSWER = (
    ('yes', "Yes"),
    ('no', "No"),
    ('unknown', "Unknown"),
)


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
