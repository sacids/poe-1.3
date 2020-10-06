from django.contrib import admin
from .models import DiseaseSurveyAns, DiseaseSurveyQns


# Register your models here.
class DiseaseSurveyAnsInline(admin.StackedInline):
    model = DiseaseSurveyAns


@admin.register(DiseaseSurveyQns)
class DiseaseSurveyQnsAdmin(admin.ModelAdmin):
    list_display = ['title', 'category', 'disease_id']
    list_filter = ['disease_id']
    search_fields = ['title__startwith']
    # inlines  = [DiseaseSurveyAnsInline]

# @admin.register(RiskAssessment)
# class RiskAssessmentAdmin(admin.ModelAdmin):
#     pass
