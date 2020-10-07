from .models import Module
from modules.travellers.models import PointOfEntry


def poe_defaults(request):

    poes    = PointOfEntry.objects.filter(agents__id=request.user.id).order_by('id')
    
    default_poe     = -1
    if poes is not None:
        default_poe     = poes[0]
    
    context = {
        'search': True,
        'login': True,
        "modules": Module.objects.all(),
        'poes': poes,
        'poe_id': request.session.get('poe_id', default_poe),
        'poe_title': request.session.get('poe_title', 'ALL'),
    }

    url_segment = request.path_info.strip("/").split("/")
    for i in range(len(url_segment)):
        context["segment_%d" % (i + 1)] = url_segment[i]

    return context
