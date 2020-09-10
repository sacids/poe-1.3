from django.shortcuts import render
from django.views import generic
from modules.travellers.models import *

# Create your views here.
class ReportView(generic.TemplateView):
    template_name   = 'report.html'

    def post(self, request, *args, **kwargs):
        context = self.get_context_data()
        for i in request.POST:
            context[i]  = request.POST[i]  
        print(context)
        return super(ReportView, self).render_to_response(context)

    def get_context_data(self, **kwargs):
        context = super(ReportView, self).get_context_data(**kwargs)
        return context

    #def exec_report(report_id, from_date = 0, to_date = 0):
        

