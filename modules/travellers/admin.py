from django.contrib import admin
from .models import *


@admin.register(Location)
class LocationAdmin(admin.ModelAdmin):
    list_display = ['id', 'title', 'code', 'parent']
    search_fields = ['title__startwith']
    ordering = ("id",)


@admin.register(PointOfEntry)
class PointOfEntryAdmin(admin.ModelAdmin):
    list_display = ['id', 'title', 'mode_of_transport']
    list_filter = ['mode_of_transport']
    search_fields = ['title__startwith']
    ordering = ("id",)


class ScreenCriteriaInline(admin.StackedInline):
    model = ScreenCriteria


@admin.register(Disease)
class DiseaseAdmin(admin.ModelAdmin):
    list_display = ['id', 'title']
    search_fields = ("title__startswith", )
    ordering = ("id",)
    inlines = [ScreenCriteriaInline]


admin.site.register(Symptom)

# @admin.register(Symptom)
# class SymptomAdmin(admin.ModelAdmin):
#     list_display = ['id','title']
#     search_fields = ['title__startwith']
#     ordering = ("id",)
