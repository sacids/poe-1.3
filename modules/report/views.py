from django.shortcuts import render
from django.views import generic

# Create your views here.
class ReportView(generic.TemplateView):
    template_name   = 'report.html'