from django.shortcuts import render
from common.models import Module_Link

# Create your views here.

def modules(request):
    model = Module_Link.objects.all()
    context = {
        "modules": model
    }

    return render(context, "sidebar.html")


def dashboard(request):
    return render('dashboard.html')