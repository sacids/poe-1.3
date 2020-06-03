from django.shortcuts import render
from modules.common.views import get_sidebar, get_module_links


def dashboard(request):
    ctx = {
        "modules": get_sidebar(),
        "sidebar": True
    }

    return render(request, 'dashboard.html', ctx)
