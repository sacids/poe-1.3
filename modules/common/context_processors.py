from .models import Module

def poe_defaults(request):
    context     = {
        'search'        : True,
        'login'         : True,
        "modules"       : Module.objects.all(),
    }

    url_segment = request.path_info.strip("/").split("/")
    for i in range(len(url_segment)):
        context["segment_%d" % (i+1)] = url_segment[i]

    return context

