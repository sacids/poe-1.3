from django.shortcuts import render
from django.core import serializers
from modules.common.models import Module_Link, Module
from modules.common.views import *


def dashboard(request):


    ctx = {
        "modules"       : get_sidebar(),
        "sidebar"       : True        
    }

    return render(request, 'dashboard.html', ctx)