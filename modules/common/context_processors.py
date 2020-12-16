from .models import Module
from modules.travellers.models import PointOfEntry


def poe_defaults(request):
    
    default_poe_id     = -1
    default_poe_title   = 'NONE'

    if request.user.is_superuser:
        poes    = PointOfEntry.objects.all().order_by('id')
        default_poe_id     = 0
        default_poe_title   = 'ALL'
    else:
        poes    = PointOfEntry.objects.filter(agents__id=request.user.id).order_by('id')
   
   
    if poes.count() > 0:
        print(poes[0].title)
        default_poe_id     = poes[0].id
        default_poe_title  = poes[0].title
    
    if request.session.get('poe_id', -1) == -1 :
        request.session['poe_id']   = default_poe_id
        request.session['poe_title']   = default_poe_title

    # if hasn't been assigned poe should not be able to 
        # Set it.
    context = {
        'search': True,
        'login': True,
        "modules": Module.objects.all().order_by('sort_order'),
        'poes': poes,
        'poe_id': request.session.get('poe_id', default_poe_id),
        'poe_title': request.session.get('poe_title', default_poe_title),
    }

    url_segment = request.path_info.strip("/").split("/")
    for i in range(len(url_segment)):
        context["segment_%d" % (i + 1)] = url_segment[i]

    return context
