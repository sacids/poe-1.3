from .models import Module
from modules.travellers.models import PointOfEntry

def poe_defaults(request):
    context     = {
        'search'        : True,
        'login'         : True,
        "modules"       : Module.objects.all(),
<<<<<<< HEAD
        'poes'          : PointOfEntry.objects.all(),
        #'poes'          : PointOfEntry.objects.filter(users__id=request.user.id),
=======
        'poes'          : PointOfEntry.objects.filter(agents__id=request.user.id),
>>>>>>> 734dd63f89208d5fed2142261dc55cbbead5839f
        'poe_id'        : request.session.get('poe_id', 0),  
        'poe_title'     : request.session.get('poe_title', 0),        
    }

    url_segment = request.path_info.strip("/").split("/")
    for i in range(len(url_segment)):
        context["segment_%d" % (i+1)] = url_segment[i]

    return context

