from django.shortcuts import render
from modules.common.views import ModulesView


def dashboard(request):
    ModulesView
    ctx = {
        "name": "Lawrance"
    }
    return render(request, 'dashboard.html', ctx)