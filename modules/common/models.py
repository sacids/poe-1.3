from django.db import models


# Create your models here.
class Module(models.Model):
    title = models.CharField(max_length=100)
    icon = models.CharField(max_length=100)
    link = models.CharField(max_length=255)
    sort_order = models.IntegerField(max_length=11, null=True)
    # perms = models.TextField(default='')

    class Meta:
        db_table = 'et_modules'

    def __str__(self):
        return self.title


class BaseModel(models.Model):
    active = models.BooleanField(default=True)
    created_at = models.DateTimeField('Created at Date', auto_now_add=True, auto_now=False)

    class Meta:
        abstract = True
        ordering = ('created_at',)
