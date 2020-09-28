from django.shortcuts import render
from django.http import HttpResponse
from django.core import serializers
from datetime import datetime, date
from modules.common.models import Module
from modules.travellers.models import *
from django.contrib.auth.decorators import login_required
from modules.travellers.views import calculate_score
from django.db import models
from django.db.models import Prefetch


@login_required
def screen(request):
    poe_id = request.session.get('poe_id')
    #print(poe_id)
    # travellers  = Traveller.objects.raw("SELECT id,full_name, id_number, name_of_transport, disease_to_screen FROM et_travellers WHERE arrival_date = '"+str(datetime.today().strftime('%Y-%m-%d')+"'"))
    travellers = (Traveller.objects
                  .select_related('location_origin')
                  .filter(arrival_date=date.today())
                  )
    if poe_id != 0:
        travellers  = travellers.filter(point_of_entry_id=poe_id)

    

    temp_a = range(34, 41)
    temp_b = range(1, 10)
    

    context = {
        "travellers": travellers,
        "temp_a": temp_a,
        "temp_b": temp_b,
    }

    # score   = calculate_score(8)
    # print(score)
    
    return render(request, 'screen.html', context)


def travellers_asJson(request):
    object_list = Traveller.objects.all()
    json = serializers.serilize('json', object_list)
    return HttpResponse(json, content_type='application/json')


def set_temp(request):
    if request.method == 'GET':
        Trav = Traveller.objects.get(pk=request.GET.get("id"))
        Temp = float(request.GET.get('temp'))
        Trav.temp   = Temp

        if Temp > 38:
            res     = 2
        elif Temp < 36:
            res     = 2
        else:
            res     = 1

        Trav.save()

    return HttpResponse(res)


def score(request):
    if request.method == 'GET':
        id = request.GET.get("id")
        #score = calculate_score(id)

    return HttpResponse(score)
