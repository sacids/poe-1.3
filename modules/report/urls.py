from django.urls import path

from . import views
#app_name    = "report"
urlpatterns = [
    path('', views.ReportView.as_view(), name='show_report'),
    path('<int:report_id>', views.ReportView.as_view(), name='show_report'),
]
#