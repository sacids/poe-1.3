from django.views import generic
from modules.travellers.models import (
    ActionTaken, Symptom, Traveller
)
from django.db.models import Count, Q, F
from .models import PointOfEntry


# Create your views here.
class ReportView(generic.TemplateView):
    template_name = 'report.html'

    def post(self, request, *args, **kwargs):
        context = self.get_context_data()
        # print(request.POST.get)
        '''
        j = exec_report(request.POST.getlist('summary'),
            request.POST.getlist('poe_id'),
            request.POST.getlist('action_taken'),
            request.POST.getlist('sex'),
            request.POST.get('from_date'),
            request.POST.get('to_date')
        )
        '''

        report_type = request.POST.get('report_type')
        if report_type == "0":
            # Line list
            j = exec_line_list(request.POST.get('from_date'), request.POST.get('to_date'))
            context['line_list'] = j
            context['report_type'] = 'line_list'
            context['search'] = 0
        else:
            series = request.POST.get('chart')
            category = request.POST.get('group_by')
            from_date = request.POST.get('from_date')
            to_date = request.POST.get('to_date')
            poes = PointOfEntry.objects.filter(agents__id=request.user.id)

            j = exec_chart(series, category, from_date, to_date)

            context['report_type'] = 'chart'
            context['search'] = 0

            if series == 'action_taken':
                series = ActionTaken.objects.all()
            else:
                series = Symptom.objects.all()

            line_list = []
            for poe in poes:
                row = []
                row.append(poe.title)
                for s in series:
                    if poe.id in j:
                        tmp = j[poe.id]
                        if s.id in tmp:
                            row.append(tmp[s.id])
                        else:
                            row.append(0)
                    else:
                        row.append(0)
                line_list.append(row)

            print(line_list)
            context['line_list'] = line_list
            context['series'] = series

            # print(context['series'])

        return super(ReportView, self).render_to_response(context)

    def get_context_data(self, **kwargs):
        context = super(ReportView, self).get_context_data(**kwargs)
        context['symptoms'] = Symptom.objects.all().order_by('-id')
        context['action_taken'] = ActionTaken.objects.all()
        return context


def exec_line_list(from_date, to_date):
    """
    f_poe               = Q()
    for poe_id in poes:
        f_poe   |= Q(point_of_entry=poe_id)
    """

    a_date = Q()
    if from_date is not None:
        a_date &= Q(arrival_date__gte=from_date)
    if to_date is not None:
        a_date &= Q(arrival_date__lte=to_date)

    qs = Traveller.objects.filter(a_date).order_by('-id')
    # print(qs.query)
    return qs


def exec_chart(series, category, from_date, to_date):
    a_date = Q()
    if from_date is not None:
        a_date &= Q(arrival_date__gte=from_date)
    if to_date is not None:
        a_date &= Q(arrival_date__lte=to_date)

    qs = Traveller.objects.filter(a_date)
    l = []
    if (category == 'day'):
        qs = qs.extra(select={'gb': 'date( arrival_date )'})
        l.append('gb')
    else:
        qs = qs.annotate(gb=F('point_of_entry'))
        l.append('gb')

    qs = qs.annotate(cat=F(series))
    l.append('cat')

    qs = qs.values(*l).annotate(cnt=Count('cat'))

    # print(qs.query)
    graph = {}
    for item in qs:
        print(item)
        graph[item['gb']] = {item['cat']: item['cnt']}

    print(graph)

    return graph


def exec_report(summary, poes, action_taken, sex, from_date, to_date):
    f_poe = Q()
    for poe_id in poes:
        f_poe |= Q(point_of_entry=poe_id)

    f_action_taken = Q()
    for action in action_taken:
        f_action_taken |= Q(action_taken=action)

    f_sex = Q()
    for s in sex:
        f_sex |= Q(sex=s)

    a_date = Q()
    if from_date is not '':
        a_date &= Q(arrival_date__gte=from_date)
    if to_date is not '':
        a_date &= Q(arrival_date__lte=to_date)

    qs = Traveller.objects.filter(f_poe & f_action_taken & f_sex & a_date)
    # qs      = Traveller.objects.all()

    values1 = [str(element) for element in summary]
    values2 = ", ".join(values1)
    print(values2)
    # qs          = qs.values(values2)

    # for group_by in summary:
    #    qs      = qs.annotate(Count(group_by))

    print(qs.query)
    for i in qs:
        for group_by in summary:
            print(i)
            tmp = group_by + '__count'
            # attr1   = getattr(i,tmp)
            # attr3   = getattr(i,'point_of_entry__count')
            attr2 = group_by
            # print(str(attr2)+' '+str(attr3)+' '+str(attr1))

    """
    arrival_date        = Q()
    if from_date is not None:
        arrival_date    &= Q(arrival_date__gt=from_date)

    if to_date is not None:
        arrival_date    &= Q(arrival_date__lt=to_date)
    """

    # report = Reports.objects.get(pk=report_id)
    # queryset = Reports.objects.raw(report.query + ' WHERE True AND (arrival_date > %s AND arrival_date < %s)',
    #                                [from_date, to_date])
    return 'jembe'
