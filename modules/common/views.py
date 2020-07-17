from django.shortcuts import render
from django.http import HttpResponse
from modules.travellers.models import PointOfEntry

def set_poe(request):
    if request.method == 'GET':
        poe_id  = request.GET.get("poe_id")
        if poe_id == '0':
            request.session['poe_id'] = 0
            request.session['poe_title'] = 'ALL'
        else:
            poe  = PointOfEntry.objects.get(pk=request.GET.get("poe_id"))
            request.session['poe_id'] = poe.id
            request.session['poe_title'] = poe.title

    return HttpResponse(request.session['poe_title'])