from django.shortcuts import render
from django.http import HttpResponse
from django.core import serializers
from datetime import datetime
from modules.travellers.models import Traveller

# Create your views here.


def screen(request):
    #travellers  = Traveller.objects.filter(arrival_date__date=datetime.today().strftime('%Y-%m-%d')).values('full_name','id_number','name_of_transport','disease_to_screen')
    travellers  = Traveller.objects.raw("SELECT id,full_name, id_number, name_of_transport, disease_to_screen FROM et_travellers WHERE arrival_date = '"+str(datetime.today().strftime('%Y-%m-%d')+"'"))
    context = {
        "sidebar": False,
        "travellers": travellers
    }
    return render(request, 'screen.html', context)


def travellers_asJson(request):
    object_list     = Traveller.objects.all()
    json            = serializers.serilize('json',object_list)
    return HttpResponse(json,content_type='application/json')