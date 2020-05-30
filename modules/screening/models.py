from django.db import models
from modules.common.models import BaseModel


class Conditions(BaseModel):
    symptom = models.CharField(max_length=255)
    score = models.PositiveIntegerField()

    class Meta(BaseModel.Meta):
        db_table = 'conditions'

    def __str__(self):
        return self.symptom

