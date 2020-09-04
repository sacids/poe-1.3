from django.db import models
from modules.travellers.models import Disease

# point of entries
class Criteria(models.Model):
    title       = models.CharField(max_length=255)
    disease     = models.ForeignKey(Disease, on_delete=models.PROTECT, related_name="disease")
    countries   = models.CharField(max_length=220)
    symptoms    = models.CharField(max_length=220)
    active      = models.BooleanField(default=True)

    class Meta:
        db_table = "et_screen_criteria"

    def __str__(self):
        return self.title
