from .models import Module

def poe_defaults(request):
    context     = {
        'search'        : True,
        'login'         : False,
        "modules"       : Module.objects.all(),
    }

    return context
