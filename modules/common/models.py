from django.db import models

# Create your models here.
class Module(models.Model):
    title   = models.CharField(max_length=100)
    icon    = models.CharField(max_length=30)
    link    = models.CharField(max_length=150)
    perms   = models.TextField(default='')

    class Meta:
        db_table = "et_modules"

    def __str__(self):
        return self.title
    

class Module_Link(models.Model):
    module  = models.ForeignKey(Module,on_delete=models.CASCADE)

    title   = models.CharField(max_length=100)
    icon    = models.CharField(max_length=30)
    link    = models.CharField(max_length=150)
    perms   = models.TextField(default='')

    class Meta:
        db_table = "et_module_links"

    def __str__(self):
        return self.title

    @staticmethod
    def get_links(id):
        return Module_Link.objects.filter(module_id=id)

    #travellers models
