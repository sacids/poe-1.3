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
from django.http import JsonResponse


@login_required
def screen(request):
    poe_id = request.session.get('poe_id')

    travellers = (Traveller.objects
                  .select_related('location_origin', 'point_of_entry')
                  .prefetch_related('visited_area')
                  .filter(arrival_date=date.today()))

    #check for poe
    if poe_id is None or poe_id == 0:
        travellers = travellers.all()
    else:
        travellers = travellers.filter(point_of_entry_id=poe_id)       

    temp_a = range(34, 41)
    temp_b = range(1, 10)
    
    #context
    context = {
        "travellers": travellers,
        "symptoms": Symptom.objects.all(),
        "temp_a": temp_a,
        "temp_b": temp_b,
    }
    
    return render(request, 'screen.html', context)


def travellers_asJson(request):
    object_list = Traveller.objects.all()
    json = serializers.serilize('json', object_list)
    return HttpResponse(json, content_type='application/json')

def update_symptoms(request):
    saved           = 1
    symptoms        = request.GET.getlist('symptoms[]')
    tid             = int(request.GET.get("traveller_id", 0))

    # delete relation
    Traveller.symptoms.through.objects.filter(traveller_id=tid).all().delete()

    Trav            = Traveller.objects.get(pk=tid)

    for symptom_id in symptoms:
        symptom     = Symptom.objects.get(pk=symptom_id)
        Trav.symptoms.add(symptom)
    
    return JsonResponse(saved, safe=False)

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


def setPaymentMethod(request):
    payment_method          = int(request.GET.get("payment_method", 1))
    order_id                = int(request.GET.get("order_id", 0))
    saved                   = 0

    try:
        CurOrder            = Order.objects.get(pk=order_id)
        CurOrder.payment_method = payment_method
        CurOrder.save()
        saved               = 1
    except Exception as e:
        print(e)
        saved               = 0

    return JsonResponse(saved, safe=False)  