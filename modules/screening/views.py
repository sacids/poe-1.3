from django.shortcuts import render
from django.http import HttpResponse
from django.core import serializers
from datetime import datetime, date
from modules.travellers.models import Traveller, TravellerSymptoms, TravellerVisitedArea

# Create your views here.


def screen(request):
    #travellers  = Traveller.objects.raw("SELECT id,full_name, id_number, name_of_transport, disease_to_screen FROM et_travellers WHERE arrival_date = '"+str(datetime.today().strftime('%Y-%m-%d')+"'"))
    travellers  =   (Traveller.objects
                            .select_related('location_origin')
                            .filter(arrival_date=date.today())
                            .values('id','full_name', 'id_number','temp', 'name_of_transport', 'disease_to_screen','location_origin__title')
                    )
    temp_a       = range(34,41)
    temp_b       = range(1,10)

    context = {
        "sidebar": False,
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
        print(request.GET.get("id"))
        print(request.GET.get('temp'))

        Trav       = Traveller.objects.get(pk = request.GET.get("id"))
        Trav.temp  = request.GET.get('temp')
        Trav.save()

    return HttpResponse(1)