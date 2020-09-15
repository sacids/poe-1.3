from django.shortcuts import render
from django.views import generic
from modules.travellers.models import *
from .models import *

# Create your views here.
class ReportView(generic.TemplateView):
    template_name   = 'report.html'

    def post(self, request, *args, **kwargs):
        context = self.get_context_data()

        report_id               = request.POST.get('report_id', 0)
        from_date               = request.POST.get('from_date', 0)
        to_date                 = request.POST.get('to_date', 0)
        context['travellers']   = exec_report(report_id,from_date,to_date)

        return super(ReportView, self).render_to_response(context)

    def get_context_data(self, **kwargs):
        context                 = super(ReportView, self).get_context_data(**kwargs)
        context['smr_options']  = {'point_of_entry','nationality','location_origin','action_taken','sex','age'}
        return context



def exec_report(report_id, from_date, to_date):
    report              = Reports.objects.get(pk=report_id)
    queryset            = Reports.objects.raw(report.query+' WHERE True AND (arrival_date > %s AND arrival_date < %s)',[from_date,to_date])
    return queryset
                

