from django.http import HttpResponseRedirect
from django.utils import translation
import datetime
from datetime import timedelta
from django.shortcuts import render, redirect
from .models import (
    Symptom, Location, Traveller, TravellerVisitedArea, PointOfEntry, ScreenCriteria
)
from .forms import TravellerForm
from django.contrib import messages
from django.conf import settings
from django.db import connection
from django.db.models import Q
from modules.dashboard.views import dashboard


def default(request):
    """ 
    Default page. 

    Function to display the default page. 

    Parameters: 
    None 

    Returns: 
    None
    """
    if request.user.is_authenticated:
        return redirect(dashboard)
    return render(request, 'travellers/home.html', {})


def change_language_en(request):
    language = "en-us"
    response = HttpResponseRedirect('/')
    if language:
        if language != settings.LANGUAGE_CODE and [lang for lang in settings.LANGUAGES if lang[0] == language]:
            redirect_path = f'/{language}'
        elif language == settings.LANGUAGE_CODE:
            redirect_path = '/'
        else:
            return response

        translation.activate(language)
        response = HttpResponseRedirect(redirect_path)
        response.set_cookie(settings.LANGUAGE_COOKIE_NAME, language)
    return response


def change_language_sw(request):
    language = "sw"
    response = HttpResponseRedirect('/')
    if language:
        if language != settings.LANGUAGE_CODE and [lang for lang in settings.LANGUAGES if lang[0] == language]:
            redirect_path = f'/{language}'
        elif language == settings.LANGUAGE_CODE:
            redirect_path = '/'
        else:
            return response

        translation.activate(language)
        response = HttpResponseRedirect(redirect_path)
        response.set_cookie(settings.LANGUAGE_COOKIE_NAME, language)
    return response


def arrival(request):
    """
    International Travellers Form.

    Function for display and submit international travellers information.

    Parameters:
    None

    Returns:
    None
    """
    # redirect path
    redirectpath = ""

    # activate current language
    translation.activate(translation.get_language())

    #if post data
    if request.method == 'POST':
        form = TravellerForm(request.POST)
        if form.is_valid():

            u = form.save()
            return render(request, 'travellers/arrival.html', {})
    else:
        form_class = TravellerForm
        return render(request, 'travellers/arrival.html', {'form': form_class,})


def departure(request):
    return render(request, 'travellers/departure.html', {})


def success(request):
    """
    Success page.

    Function to display success page

    Parameters:
    None

    Returns:
    None
    """

    # activate current language
    translation.activate(translation.get_language())

    return render(request, 'travellers/success.html', {})


def calculate_score(traveller_id):

    countries = get_travellers_countries(traveller_id)
    symptoms = get_travellers_symptoms(traveller_id)
    location = Traveller.objects.get(pk=traveller_id).location_origin.id

    fc = Q()
    fs = Q()

    fc |= Q(countries__id=location)
    for c in countries:
        fc |= Q(countries__id=c.id, )

    for s in symptoms:
        fs |= Q(symptoms__id=s.id, )

    active = Q(active=1)
    queryset = ScreenCriteria.objects.filter(
        (fc | fs) & active).values('disease_id').distinct()
    # print(queryset.query)
    # if count is more than one join otherwise set zero
    if queryset.count() > 0:
        score = ', '.join(str(id['disease_id']) for id in queryset)
        return score
    else:
        return 0


def calculate_score1(traveller_id):
    """
    Calculate score

    Function to calculate score

    Parameters:
    int: unique id of traveller

    Returns:
    int: calculated score

    """
    cur = connection.cursor()

    criteria = build_criteria_query(get_travellers_countries(
        traveller_id), get_travellers_symptoms(traveller_id))
    # query2 = ScreenCriteria.objects.values('id', 'disease_id').filter(Q(active=1) & Q(criteria=criteria))
    query = "SELECT id,disease_id FROM et_ss_criteria WHERE active = '1' AND ( " + \
            criteria + " )"

    cur.execute(query)
    connection.commit()
    records = cur.fetchall()
    s = [0]
    for row in records:
        s.append(row[1])

    cur.close()
    connection.close()
    score = ','.join(str(x) for x in s)
    return score


def build_criteria_query(countries, symptoms):
    """
    Build criteria algorthm query

    Function to build query for calculating criteria

    Parameters:
    array: countries
    array: symptoms

    Returns:
    str: query
    """

    q = []
    if len(list(symptoms)) != 0:
        s = "( symptoms LIKE '%S" + "S%' OR symptoms LIKE '%S".join(str(x.id)
                                                                    for x in symptoms) + "S%')"
        q.append(s)
    if len(list(countries)) != 0:
        c = "( countries LIKE '%C" + "C%' OR countries LIKE '%C".join(str(x.id)
                                                                      for x in countries) + "C%')"
        q.append(c)

    return ' AND '.join(q)


def get_travellers_countries(tv_id):
    """
    Query lists ot countries traveller visited

    Parameters:
    int: unique id of traveller

    Returns:
    array: list of registered countries

    """
    countries = TravellerVisitedArea.objects.filter(traveller_id=tv_id)
    return countries


def get_travellers_symptoms(tv_id):
    """
    Query lists ot symptoms traveller reported

    Parameters:
    int: unique id of traveller

    Returns:
    array: list of symptoms

    """
    symptoms = Traveller.symptoms.through.objects.filter(
        traveller_id=tv_id).all()

    return symptoms


def auto_districts(request):
    """
    Auto select district from region 

    Parameters:
    int: id of region (GET)

    Returns:
    None

    """

    if request.method == 'GET':
        region_id = request.GET.get('region_id')
        districts = Location.objects.filter(parent=region_id)

        # return response.
        return render(None, 'travellers/auto_districts.html', {'districts': districts})


def auto_point_of_entries(request):
    """
    Auto select point of entries from mode of transport

    Parameters:
    str: mode of transport (GET)

    Returns:
    None

    """

    if request.method == 'GET':
        mode_of_transport = request.GET.get('mode_of_transport')
        # check for mode of transport
        if (mode_of_transport == 'truck'):
            mode_of_transport = 'vehicle'
        elif (mode_of_transport == 'bus'):
            mode_of_transport = 'vehicle'

        point_of_entries = PointOfEntry.objects.filter(
            mode_of_transport=mode_of_transport)

        # return response
        return render(None, 'travellers/auto_point_of_entries.html', {'point_of_entries': point_of_entries})


# cast mobile
def cast_phone(phone):
    if phone.startswith('0'):
        return phone[1:]
    else:
        return phone
