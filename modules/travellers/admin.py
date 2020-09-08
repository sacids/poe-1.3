from django.contrib import admin
from .models import *

@admin.register(Location)
class LocationAdmin(admin.ModelAdmin):
    list_display = ['title', 'code',]
    search_fields = ['title__startwith']

@admin.register(PointOfEntry)
class PointOfEntryAdmin(admin.ModelAdmin):
    list_display = ['title', 'mode_of_transport']
    list_filter = ['mode_of_transport']
    search_fields = ['title__startwith']

class ScreenCriteriaInline(admin.StackedInline):
    model = ScreenCriteria

@admin.register(Disease)
class DiseaseAdmin(admin.ModelAdmin):
    list_display = ['title']
    ordering = ('title',)
    search_fields = ("title__startswith", )
    inlines  = [ScreenCriteriaInline]

@admin.register(Symptom)
class SymptomAdmin(admin.ModelAdmin):
    list_display = ['title']
    ordering = ('title',)
    search_fields = ['title__startwith']



#admin.site.register(Traveller)
#admin.site.register(TravellerVisitedArea)
#admin.site.register(TravellerSymptom) 
 

# @admin.register(InternationalTravellerExt)
# class TravellerExtAdmin(admin.ModelAdmin):
#     list_display = ('international_traveller', 'country', 'location_visited', 'date', 'days')
#     search_fields = ('country', 'location_visited')
#
#
# @admin.register(TravellerSymptom)
# class TravellerSymptomAdmin(admin.ModelAdmin):
#     list_display = ('condition',)
#     search_fields = ('condition',)
