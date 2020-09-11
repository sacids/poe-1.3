from django import template
from django.http import HttpResponseRedirect
from django.utils import translation
import datetime
from datetime import timedelta
from django.shortcuts import render, render_to_response, redirect
from .models import *
from .forms import TravellerForm
from django.contrib import messages
from django.conf import settings
from django.db import models


def default(request):
    """ 
    Default page. 

    Function to display the default page. 

    Parameters: 
    None 

    Returns: 
    None

    """
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


def international(request):
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

    # data
    symptoms = Symptom.objects.all()  # symptoms
    countries = Location.objects.filter(parent=0)  # countries
    today = datetime.date.today().strftime("%Y-%m-%d")
    last_21_days = (datetime.date.today() -
                    timedelta(days=21)).strftime("%Y-%m-%d")

    # if POST
    if request.method == "POST":
        form = TravellerForm(request.POST)

        # attributes
        attr = {'form': form, 'countries': countries,
                'today': today, 'last_21_days': last_21_days}

        if form.is_valid():
            # process form data
            traveller = Traveller()  # gets new object
            traveller.type = "international"
            traveller.id_type = "passport-number"
            traveller.full_name = form.cleaned_data['full_name']
            traveller.age = form.cleaned_data['age']
            traveller.sex = form.cleaned_data['sex']
            traveller.nationality = request.POST.get('nationality')
            traveller.id_number = form.cleaned_data['id_number']
            traveller.arrival_date = form.cleaned_data['arrival_date']
            traveller.point_of_entry_id = request.POST.get('point_of_entry')
            traveller.mode_of_transport = form.cleaned_data['mode_of_transport']
            traveller.name_of_transport = form.cleaned_data['name_of_transport']
            traveller.seat_no = form.cleaned_data['seat_no']

            traveller.visiting_purpose = form.cleaned_data['visiting_purpose']
            traveller.other_purpose = form.cleaned_data['other_purpose']

            if request.POST.get('duration_of_stay') is None:
                traveller.duration_of_stay = request.POST.get(
                    'duration_of_stay')

            traveller.employment = form.cleaned_data['employment']
            traveller.other_employment = form.cleaned_data['other_employment']

            traveller.physical_address = form.cleaned_data['physical_address']
            traveller.hotel_name = form.cleaned_data['hotel_name']
            traveller.region_id = request.POST.get('region_id')

            if request.POST.get('district_id') is None:
                traveller.district_id = request.POST.get('district_id')

            traveller.street_or_ward = form.cleaned_data['street_or_ward']
            traveller.phone = form.cleaned_data['phone']
            traveller.email = form.cleaned_data['email'].lower()

            traveller.location_origin_id = request.POST.get('location_origin')
            traveller.other_symptoms = request.POST.get('other_symptoms')
            traveller.accept = request.POST.get('accept')

            # finally save the traveller in db
            traveller.save()

            # insert into traveller visited sites
            if request.POST.get('location'):
                location = request.POST.getlist('location', '')
                location_visited = request.POST.getlist('location_visited', '')
                date = request.POST.getlist('date', '')
                days = request.POST.getlist('days', '')

                # zipped
                zipped = zip(location, location_visited, date, days)

                for location, location_visited, date, days in zipped:
                    visited_area = TravellerVisitedArea()  # traveller visited area object
                    visited_area.traveller_id = traveller.id
                    visited_area.location_id = location
                    visited_area.location_visited = location_visited
                    visited_area.date = date
                    visited_area.days = days

                    # finally save traveller visited areas
                    visited_area.save()

            # insert into traveller symptoms
            symptoms = request.POST.getlist('symptoms')

            for symptom_id in symptoms:
                traveller_symptom = TravellerSymptom()  # traveller symptom object
                traveller_symptom.traveller_id = traveller.id
                traveller_symptom.symptom_id = symptom_id

                # finally save traveller symptoms
                traveller_symptom.save()

                # todo: call function to calculate score
                score = calculate_score(traveller.id)

                if score is None:
                    action_taken = 'Allowed'
                else:
                    action_taken = 'Screening'
                    
                # update traveller
                traveller_up = Traveller.objects.get(pk=traveller.id)
                traveller_up.disease_to_screen = score
                traveller_up.action_taken = action_taken
                traveller_up.save()

            messages.add_message(request, messages.SUCCESS,
                                 'Success! Saved Successfully!')
            if translation.get_language() == 'en-us':
                redirectpath = "/success"
            elif translation.get_language() == "sw":
                redirectpath = "/sw/success"

            return redirect(redirectpath)
        else:
            messages.add_message(request, messages.WARNING,
                                 'Warning! Please check all the fields!')

        return render(request, 'travellers/international.html', attr)

    else:
        form = TravellerForm()
        return render(request, 'travellers/international.html',
                      {'form': form, 'countries': countries, 'symptoms': symptoms, 'today': today, 'last_21_days': last_21_days})


def domestic(request):
    return render(request, 'travellers/domestic.html', {})


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
    Location = Traveller.objects.get(pk=traveller_id).location_origin.id

    fc = models.Q()
    fs = models.Q()

    fc |= models.Q(countries__id=Location)
    for c in countries:
        fc |= models.Q(countries__id=c.id,)

    for s in symptoms:
        fs |= models.Q(symptoms__id=s.id,)

    queryset = ScreenCriteria.objects.filter(fc & fs).distinct()
    score = ', '.join(str(id.disease_id) for id in queryset)
    return score


def calculate_score1(traveller_id):
    """
    Calculate score

    Function to calculate score

    Parameters:
    int: unique id of traveller

    Returns:
    int: calculated score

    """
    from django.db import connection
    cur = connection.cursor()

    criteria = build_criteria_query(get_travellers_countries(
        traveller_id), get_travellers_symptoms(traveller_id))
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

    symptoms = TravellerSymptom.objects.filter(traveller_id=tv_id)
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
        return render_to_response('travellers/auto_districts.html', {'districts': districts})


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
        point_of_entries = PointOfEntry.objects.filter(
            mode_of_transport=mode_of_transport)

        # return response
        return render_to_response('travellers/auto_point_of_entries.html', {'point_of_entries': point_of_entries})
