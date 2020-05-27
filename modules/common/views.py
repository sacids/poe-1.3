from django.shortcuts import render
from modules.common.models import Module_Link, Module


def ModulesView(request):
    print("user: ", request.user)
    model = Module_Link.objects.all()
    context = {
        "modules": model
    }
    print("context:  ", context)

    return render(request,  "backend/sidebar.html", context)