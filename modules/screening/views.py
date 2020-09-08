from django.shortcuts import render
from django.http import HttpResponse
from django.core import serializers
from datetime import datetime, date
from modules.common.models import Module
from modules.travellers.models import Traveller, TravellerSymptom, TravellerVisitedArea, ScreenCriteria
from django.contrib.auth.decorators import login_required
from modules.travellers.views import get_travellers_countries, get_travellers_symptoms
from django.db import models


@login_required
def screen(request):
    poe_id = request.session.get('poe_id')
    #print(poe_id)
    # travellers  = Traveller.objects.raw("SELECT id,full_name, id_number, name_of_transport, disease_to_screen FROM et_travellers WHERE arrival_date = '"+str(datetime.today().strftime('%Y-%m-%d')+"'"))
    travellers = (Traveller.objects
                  .select_related('location_origin')
                  .filter(arrival_date=date.today())
                  .values('id', 'full_name', 'id_number', 'temp', 'name_of_transport', 'disease_to_screen',
                          'location_origin__title')
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


    countries       = get_travellers_countries(8)
    symptoms        = get_travellers_symptoms(8)
    Location        = Traveller.objects.get(pk=8).location_origin.id

    filters         = models.Q()
    fc              = models.Q()
    fs              = models.Q()

    fc              |= models.Q(countries__id=Location)
    for c in countries:
        fc |= models.Q(countries__id=c.id,)
    
    for s in symptoms:
        fs |= models.Q( symptoms__id=s.id,)

    queryset        = ScreenCriteria.objects.filter(fc & fs).distinct()

    print(filters)
    for q in queryset:
        print(q.disease_id)

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
