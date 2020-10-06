from django.contrib import admin
from .models import Module


# Register your models here.
class ModuleAdmin(admin.ModelAdmin):
    list_display = ['id', 'title', 'icon', 'link']


admin.site.register(Module, ModuleAdmin)
