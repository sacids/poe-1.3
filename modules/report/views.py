from django.shortcuts import render
from django.views import generic
from django.db import models
from modules.travellers.models import *
from django.db.models import Count
from .models import *

# Create your views here.
class ReportView(generic.TemplateView):
    template_name   = 'report.html'

    def post(self, request, *args, **kwargs):
        context = self.get_context_data()
        print(request.POST.get)

        j = exec_report(request.POST.getlist('summary'),
            request.POST.getlist('poe_id'),
            request.POST.getlist('action_taken'),
            request.POST.getlist('sex'),
            request.POST.get('from_date'),
            request.POST.get('to_date')
        )

        return super(ReportView, self).render_to_response(context)

    def get_context_data(self, **kwargs):
        context                 = super(ReportView, self).get_context_data(**kwargs)
        context['smr_options']  = {'point_of_entry','nationality','location_origin','action_taken','sex','age','temp'}
        context['action_taken'] = ActionTaken.objects.all()
        return context

def exec_report(summary,poes,action_taken,sex,from_date,to_date):


    #from modules.travellers.models import Traveller

    f_poe               = models.Q()
    for poe_id in poes:
        f_poe   != models.Q(point_of_entry=poe_id)

    f_action_taken      = models.Q()
    for action in action_taken:
        f_action_taken  |= models.Q(action_taken=action)
    
    f_sex               = models.Q()
    for s in sex:
        f_sex           |= models.Q(sex=s)
    
    a_date              = models.Q()
    if from_date is not '':
        a_date          &= models.Q(arrival_date__gte=from_date)
    if to_date is not '':
        a_date          &= models.Q(arrival_date__lte=to_date)

    qs      = Traveller.objects.filter(f_poe & f_action_taken & f_sex & a_date)
    #qs      = Traveller.objects.all()

    values1     = [str(element) for element in summary]
    values2     = ",".join(values1)

    qs          = qs.values(values2)
    
    for group_by in summary:
        qs      = qs.annotate(Count(group_by))


    print(qs.query)
    for i in qs:
        for group_by in summary:
            print(i)
            tmp     = group_by+'__count'
            #attr1   = getattr(i,tmp)
            #attr3   = getattr(i,'point_of_entry__count')
            attr2   = group_by
            #print(str(attr2)+' '+str(attr3)+' '+str(attr1))
    
    '''
    arrival_date        = models.Q()
    if from_date is not None:
        arrival_date    &= models.Q(arrival_date__gt=from_date)

    if to_date is not None:
        arrival_date    &= models.Q(arrival_date__lt=to_date)
    '''

    #report              = Reports.objects.get(pk=report_id)
    #queryset            = Reports.objects.raw(report.query+' WHERE True AND (arrival_date > %s AND arrival_date < %s)',[from_date,to_date])
    return 'jembe'
                

