from django.db import models
from modules.travellers.models import PointOfEntry

# Create your models here.
# Reports
class Reports(models.Model):
    """A class to create report table."""
    title           = models.CharField(max_length=50)
    description     = models.TextField(null=True)
    query           = models.TextField()

    class Meta:
        db_table = "et_reports"
        verbose_name_plural = "Reports"

    def __str__(self):
        return self.title
