from django.contrib import admin
from .models import *

admin.site.register(Location)
admin.site.register(PointOfEntry)
admin.site.register(TravellerVisitedArea)
admin.site.register(TravellerSymptom)
admin.site.register(Symptom)
admin.site.register(ScreenCriteria)
admin.site.register(Disease)


@admin.register(Traveller)
class TravellerAdmin(admin.ModelAdmin):
    list_display = ('full_name', 'type', 'sex')
    search_fields = ('full_name', 'passport_no')

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
