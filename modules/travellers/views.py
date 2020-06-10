from django.shortcuts import render, render_to_response, HttpResponse
from .models import Traveller, TravellerVisitedArea, TravellerSymptom, Location
from .forms import TravellerForm
from django.contrib import messages


def default(request):
    return render(request, 'travellers/home.html', {})


def international(request):
    # countries
    countries = Location.objects.filter(parent=0)

    # if POST
    if request.method == "POST":
        form = TravellerForm(request.POST)

        # attributes
        attr = {'form': form, 'countries': countries}

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
            traveller.duration_of_stay = form.cleaned_data['duration_of_stay']
            traveller.employment = form.cleaned_data['employment']
            traveller.other_employment = form.cleaned_data['other_employment']

            traveller.physical_address = form.cleaned_data['physical_address']
            traveller.hotel_name = form.cleaned_data['hotel_name']
            traveller.region_id = request.POST.get('region_id')
            traveller.district_id = request.POST.get('district_id')
            traveller.street_or_ward = form.cleaned_data['street_or_ward']
            traveller.phone = form.cleaned_data['phone']
            traveller.email = form.cleaned_data['email']

            traveller.location_origin_id = request.POST.get('location_origin')

            # finally save the traveller in db
            traveller.save()

            # insert into traveller visited sites
            location = request.POST.getlist('location')
            location_visited = request.POST.getlist('location_visited')
            date = request.POST.getlist('date')
            days = request.POST.getlist('days')

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

            for symptom in symptoms:
                traveller_symptom = TravellerSymptom()  # traveller symptom object
                traveller_symptom.traveller_id = traveller.id
                traveller_symptom.symptom_id = symptom

                # finally save traveller symptoms
                traveller_symptom.save()

                # todo: call function to calculate score
                score = calculate_score(traveller.id)

                # update traveller
                traveller_up = Traveller
                traveller_up.disease_to_screen = score
                traveller_up.save()

            messages.add_message(request, messages.SUCCESS, 'Success! Saved Successfully!')
        else:
            messages.add_message(request, messages.WARNING, 'Warning! Please check all the fields!')

        return render(request, 'travellers/international.html', attr)

    else:
        form = TravellerForm()
        return render(request, 'travellers/international.html', {'form': form, 'countries': countries})


def domestic(request):
    return render(request, 'travellers/domestic.html', {})


def calculate_score(traveller_id):
    from django.db import connection
    cur = connection.cursor()

    criteria = build_criteria_query(get_travellers_countries(traveller_id), get_travellers_symptoms(traveller_id))
    query = "SELECT id,disease_id FROM et_ss_criteria WHERE active = '1' AND ( " + criteria + " )"

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
    q = []
    if len(list(symptoms)) != 0:
        s = "( symptoms LIKE '%S" + "S%' OR symptoms LIKE '%S".join(str(x.id) for x in symptoms) + "S%')"
        q.append(s)
    if len(list(countries)) != 0:
        c = "( countries LIKE '%C" + "C%' OR countries LIKE '%C".join(str(x.id) for x in countries) + "C%')"
        q.append(c)

    return ' AND '.join(q)


def get_travellers_countries(tv_id):
    countries = TravellerVisitedArea.objects.filter(traveller_id=tv_id)
    return countries


def get_travellers_symptoms(tv_id):
    symptoms = TravellerSymptom.objects.filter(traveller_id=tv_id)
    return symptoms


def auto_districts(request):
    # if request post
    if request.method == 'POST':
        region_id = request.POST.get('region_id')
        districts = Location.objects.filter(parent=region_id)

        print(districts)

        # return response.
        return render_to_response('travellers/districts_request.html', {'districts': districts})
