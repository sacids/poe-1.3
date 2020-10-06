from django.contrib import admin
from .models import Location, TravellerVisitedArea, PointOfEntry, ScreenCriteria
from modules.secondary_screening.models import Traveller, Disease, Symptom, DiseaseSurveyQns


@admin.register(Location)
class LocationAdmin(admin.ModelAdmin):
    list_display = ['id', 'title', 'code', 'parent']
    search_fields = ['title__startwith']
    ordering = ("id",)


@admin.register(TravellerVisitedArea)
class TravellerVisitedAreaAdmin(admin.ModelAdmin):
    list_display = ['id', 'location', 'location_visited', 'date', 'days']
    search_fields = ['title__startwith']
    ordering = ("id",)


@admin.register(Traveller)
class TravellerAdmin(admin.ModelAdmin):
    list_display = ['id', 'other_names', 'surname']


@admin.register(PointOfEntry)
class PointOfEntryAdmin(admin.ModelAdmin):
    list_display = ['id', 'title', 'code', 'mode_of_transport', 'category']
    list_filter = ['category']
    search_fields = ['title__startwith']
    ordering = ("id",)


class ScreenCriteriaInline(admin.TabularInline):
    model = ScreenCriteria
    extra = 0


class DiseaseSurveyAnsInline(admin.StackedInline):
    model = DiseaseSurveyQns


@admin.register(Disease)
class DiseaseAdmin(admin.ModelAdmin):
    list_display = ['id', 'title']
    search_fields = ("title__startswith",)
    ordering = ("id",)
    inlines = [ScreenCriteriaInline, DiseaseSurveyAnsInline]


@admin.register(Symptom)
class SymptomAdmin(admin.ModelAdmin):
    list_display = ['id', 'title', 'title_sw']
    search_fields = ['title__startwith']
    ordering = ("id",)

admin.site.register(ActionTaken)
