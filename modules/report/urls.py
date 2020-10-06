from django.urls import path

from .views import ReportView

# app_name    = "report"
urlpatterns = [
    path('', ReportView.as_view(), name='show_report'),
]
