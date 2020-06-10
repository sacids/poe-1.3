from django.shortcuts import render
from django.http import HttpResponse
from django.core import serializers
from datetime import datetime, date
from modules.common.models import Module
from modules.travellers.models import Traveller, TravellerSymptoms, TravellerVisitedArea, TravellerSymptoms, ScreenCriteria

# Create your views here.


def screen(request):
    #travellers  = Traveller.objects.raw("SELECT id,full_name, id_number, name_of_transport, disease_to_screen FROM et_travellers WHERE arrival_date = '"+str(datetime.today().strftime('%Y-%m-%d')+"'"))
    travellers  =   (Traveller.objects
                            .select_related('location_origin')
                            #.filter(arrival_date=date.today())
                            .values('id','full_name', 'id_number','temp', 'name_of_transport', 'disease_to_screen','location_origin__title')
                    )
    temp_a       = range(34,41)
    temp_b       = range(1,10)

    context = {
        "travellers": travellers,
        "temp_a": temp_a,
        "temp_b": temp_b,
    }
    return render(request, 'screen.html', context)


def travellers_asJson(request):
    object_list     = Traveller.objects.all()
    json            = serializers.serilize('json',object_list)
    return HttpResponse(json,content_type='application/json')

def set_temp(request):
    if request.method == 'GET':
        Trav       = Traveller.objects.get(pk = request.GET.get("id"))
        Trav.temp  = request.GET.get('temp')
        Trav.save()

    return HttpResponse(1)

def score(request):
    if request.method == 'GET':
        id = request.GET.get("id")
        score = calculate_score(id)

    return HttpResponse(score)

def calculate_score(id):
    from django.db import connection
    cur         = connection.cursor()

    criteria    = build_criteria_query(get_travellers_countries(id), get_travellers_symptoms(id))
    query       = "SELECT id,disease_id FROM et_ss_criteria WHERE active = '1' AND ( "+criteria+" )"

    cur.execute(query)
    connection.commit()
    records     = cur.fetchall()
    s           = [0]
    for row in records:
        s.append(row[1])

    cur.close()
    connection.close()
    score = ','.join(str(x) for x in s)
    return score
  
   
def get_travellers_countries(id):
    countries       = TravellerVisitedArea.objects.filter(traveller_id=id)
    return (countries)

def get_travellers_symptoms(id):
    symptoms       = TravellerSymptoms.objects.filter(traveller_id=id)
    return (symptoms)

def build_criteria_query(countries, symptoms):
    q   = []
    if len(list(symptoms)) != 0:
        s   = "( symptoms LIKE '%S"+"S%' OR symptoms LIKE '%S".join( str(x.id) for x in symptoms )+"S%')"
        q.append(s)
    if len(list(countries)) != 0:
        c   =  "( countries LIKE '%C"+"C%' OR countries LIKE '%C".join( str(x.id) for x in countries )+"C%')"
        q.append(c)

    return ' AND '.join(q)


