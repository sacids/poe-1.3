from django.http import HttpResponseRedirect, HttpResponse
from django.views.generic import View
from django.utils import translation
from django.shortcuts import get_object_or_404
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

# importing get_template from loader
from django.template.loader import get_template

# import render_to_pdf from util.py
from .utils import render_to_pdf


def home(request):
    """
    Default page.

    Function to display the default page.

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
    today = datetime.date.today().strftime("%Y-%m-%d")

    # check if user authenticate
    if request.user.is_authenticated:
        return redirect(dashboard)
    else:
        if request.method == "POST":
            travel_type = request.POST.get('travel_type')
            passport_number = request.POST.get('id_number')
            arrival_date = request.POST.get('arrival_date')

            # query traveller
            try:
                traveller = Traveller.objects.get(
                    category=travel_type, id_number=passport_number, arrival_date=arrival_date)

                # check for language
                if translation.get_language() == 'en-us':
                    redirectpath = "/preview/" + str(traveller.id)
                elif translation.get_language() == "sw":
                    redirectpath = "/sw/preview/" + str(traveller.id)
            except:
                # check for language
                if translation.get_language() == 'en-us':
                    redirectpath = "/arrival"
                elif translation.get_language() == "sw":
                    redirectpath = "/sw/arrival"
            # redirect
            return redirect(redirectpath)
        # render view
        return render(request, 'travellers/home.html', {'today': today})


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

    # data
    symptoms = Symptom.objects.all()  # symptoms
    countries = Location.objects.filter(
        parent=0).order_by('title')  # countries
    today = datetime.date.today().strftime("%Y-%m-%d")
    yesterday = (datetime.date.today() -
                 timedelta(days=1)).strftime("%Y-%m-%d")
    last_21_days = (datetime.date.today() -
                    timedelta(days=21)).strftime("%Y-%m-%d")

    # if post data
    if request.method == 'POST':
        form = TravellerForm(request.POST)
        # context
        attr = {'form': form, 'countries': countries, 'symptoms': symptoms,
                'today': today, 'yesterday': yesterday, 'last_21_days': last_21_days}

        if form.is_valid():
            # process form data
            traveller = Traveller()  # gets new object
            traveller.category = "arrival"
            traveller.id_type = "passport-number"
            traveller.surname = form.cleaned_data['surname']
            traveller.other_names = form.cleaned_data['other_names']
            traveller.age_category = form.cleaned_data['age_category']
            traveller.age = form.cleaned_data['age']
            traveller.sex = form.cleaned_data['sex']
            traveller.nationality = form.cleaned_data['nationality']
            traveller.id_number = form.cleaned_data['id_number']
            traveller.arrival_date = form.cleaned_data['arrival_date']
            traveller.point_of_entry = form.cleaned_data['point_of_entry']
            traveller.mode_of_transport = form.cleaned_data['mode_of_transport']
            traveller.name_of_transport = form.cleaned_data['name_of_transport']
            traveller.seat_number = form.cleaned_data['seat_number']

            traveller.visiting_purpose = form.cleaned_data['visiting_purpose']
            traveller.other_purpose = form.cleaned_data['other_purpose']

            if request.POST.get('duration_of_stay') != '':
                traveller.duration_of_stay = request.POST.get(
                    'duration_of_stay')

            traveller.employment = form.cleaned_data['employment']
            traveller.other_employment = form.cleaned_data['other_employment']

            traveller.physical_address = form.cleaned_data['physical_address']
            traveller.region = form.cleaned_data['region_id']

            if request.POST.get('district') != '':
                traveller.district = request.POST.get('district')

            traveller.street_or_ward = form.cleaned_data['street_or_ward']
            traveller.phone = form.cleaned_data['phone']
            traveller.email = form.cleaned_data['email'].lower()

            traveller.location_origin = form.cleaned_data['location_origin']
            traveller.other_symptoms = form.cleaned_data['other_symptoms']
            traveller.accept = form.cleaned_data['accept']

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

            traveller_sym = Traveller.objects.get(pk=traveller.id)
            for symptom_id in symptoms:
                symptom = Symptom.objects.get(pk=symptom_id)
                # finally save traveller symptoms
                traveller_sym.symptoms.add(symptom)

            # todo: call function to calculate score
            score = calculate_score(traveller.id)
            print("Score => " + str(score))

            if score == 0:
                action_taken = 1
            else:
                action_taken = 2

            # update traveller
            traveller_up = Traveller.objects.get(pk=traveller.id)
            traveller_up.disease_to_screen = score
            traveller_up.action_taken_id = action_taken
            traveller_up.save()

            if translation.get_language() == 'en-us':
                redirectpath = "/preview/" + traveller.id
            elif translation.get_language() == "sw":
                redirectpath = "/sw/preview/" + traveller.id

            return redirect(redirectpath)

    else:
        form_class = TravellerForm
        form_class.base_fields["nationality"].queryset = Location.objects.filter(
            parent=0).order_by('title')
        form_class.base_fields["region"].queryset = Location.objects.filter(
            code="TZR").order_by('title')
        form_class.base_fields["district"].queryset = Location.objects.filter(
            code="TZD").order_by('title')
        form_class.base_fields["location_origin"].queryset = Location.objects.filter(
            parent=0).order_by('title')

        # context
        attr = {'form': form_class, 'countries': countries, 'symptoms': symptoms,
                'today': today, 'yesterday': yesterday, 'last_21_days': last_21_days}

        # render view
        return render(request, 'travellers/arrival.html', attr)


def departure(request):
    return render(request, 'travellers/departure.html', {})


# preview data
def preview(request, **kwargs):
    traveller_id = kwargs['pk']  # traveller_id

    # context
    attr = {}

    try:
        traveller = Traveller.objects.select_related('nationality', 'region', 'district', 'location_origin',
                                                     'point_of_entry').get(pk=traveller_id)
        visited_countries = TravellerVisitedArea.objects.select_related('location').filter(
            traveller_id=traveller_id).values("location__title", "location_visited", "days", "date")
        symptoms = Traveller.symptoms.through.objects.filter(
            traveller_id=traveller_id).values("symptom__title")

        # context
        attr = {"traveller": traveller,
                "countries": visited_countries, "symptoms": symptoms}

    except:
        # check for language
        redirectpath = ""
        if translation.get_language() == 'en-us':
            redirectpath = "/arrival"
        elif translation.get_language() == "sw":
            redirectpath = "/sw/arrival"
        return redirect(redirectpath)

    return render(request, 'travellers/preview.html', attr)

# print pdf


def generate_pdf(request, **kwargs):
    traveller_id = kwargs['pk']  # traveller_id

    # context
    attr = {}

    try:
        traveller = Traveller.objects.select_related('nationality', 'region', 'district', 'location_origin',
                                                     'point_of_entry').get(pk=traveller_id)
        visited_countries = TravellerVisitedArea.objects.select_related('location').filter(
            traveller_id=traveller_id).values("location__title", "location_visited", "days", "date")
        symptoms = Traveller.symptoms.through.objects.filter(
            traveller_id=traveller_id).values("symptom__title")

        # context
        attr = {"traveller": traveller,
                "countries": visited_countries, "symptoms": symptoms}
    except:
        pass
    # getting the template
    #pdf = render_to_pdf('travellers/pdf.html', attr)

    # rendering the template
    # return HttpResponse(pdf, content_type='application/pdf')
    return render(request, 'travellers/pdf.html', attr)


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

    return render(request, 'travellers/pdf.html', {})


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
    print(queryset.query)
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
