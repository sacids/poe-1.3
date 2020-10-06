from django.views import generic
from modules.travellers.models import ActionTaken


# Create your views here.
class ReportView(generic.TemplateView):
    template_name = 'reports.html'

    def post(self, request, *args, **kwargs):
        context = self.get_context_data()
        print(request.POST.get)

        return super(ReportView, self).render_to_response(context)

    def get_context_data(self, **kwargs):
        context = super(ReportView, self).get_context_data(**kwargs)
        # context['smr_options']  = \
        #     {'point_of_entry','nationality','location_origin','action_taken','sex','age','temp'}
        context['action_taken'] = ActionTaken.objects.all()
        return context
