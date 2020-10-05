import json
import datetime
from django.shortcuts import render
from modules.travellers.models import *
from django.db.models import F
from django.contrib.auth.decorators import login_required


@login_required
def dashboard(request):
    poe_series_data = list()
    passengers_series_data = list()
    symptom_series_data = list()
    symptom_occurrence_data = list()

    # number of passenger per poe
    poe_id = request.session.get('poe_id')

    # all queries
    # traveller objects
    travellers = Traveller.objects

    # reported symptoms
    symptoms = Symptom.objects.all()

    # filter per point of entry
    if poe_id is None or poe_id == 0:
        # dictionaries
        point_of_entries = PointOfEntry.objects.all()
        traveller_symptoms = Traveller.symptoms.through.objects

        # stats
        total_passengers = travellers
        allowed_to_proceed = travellers.filter(action_taken_id=1)
        secondary_screening = travellers.filter(action_taken_id=2)

        passenger_with_normal_temp = travellers.filter(
            temp__gte=35, temp__lte=36.9)
        passenger_with_below_normal_temp = travellers.filter(temp__lte=35)
        passenger_with_above_normal_temp = travellers.filter(temp__gte=37)
        male_passenger_with_above_normal_temp = travellers.filter(
            sex='M', temp__gte=38)
        female_passenger_with_above_normal_temp = travellers.filter(
            sex='F', temp__gte=38)
    else:        
        # dictionaries
        point_of_entries = PointOfEntry.objects.filter(pk=poe_id)
        traveller_symptoms = (Traveller.symptoms.through.objects.filter(
            traveller__point_of_entry_id=poe_id).values('id', 'symptom_id'))

        # stats
        total_passengers = travellers.filter(point_of_entry_id=poe_id)
        allowed_to_proceed = travellers.filter(
            point_of_entry_id=poe_id, action_taken_id=1)
        secondary_screening = travellers.filter(
            point_of_entry_id=poe_id, action_taken_id=2)

        passenger_with_normal_temp = travellers.filter(
            point_of_entry_id=poe_id, temp__gte=35, temp__lte=36.9)
        passenger_with_below_normal_temp = travellers.filter(
            point_of_entry_id=poe_id, temp__lte=35)
        passenger_with_above_normal_temp = travellers.filter(
            point_of_entry_id=poe_id, temp__gte=37)
        male_passenger_with_above_normal_temp = travellers.filter(
            point_of_entry_id=poe_id, sex='M', temp__gte=38)
        female_passenger_with_above_normal_temp = travellers.filter(
            point_of_entry_id=poe_id, sex='F', temp__gte=38)


    # filter
    if request.method == 'POST':
        day = request.POST.get('day')

        # todo: improve queries in future
        today = datetime.datetime.now()
        if day == 'today':
            # queries
            total_passengers = total_passengers.filter(
                arrival_date=today).count()
            allowed_to_proceed = allowed_to_proceed.filter(
                arrival_date=today, action_taken_id=1).count()
            secondary_screening = secondary_screening.filter(
                arrival_date=today, action_taken_id=2).count()

            passenger_with_normal_temp = passenger_with_normal_temp.filter(
                arrival_date=today).count()
            passenger_with_below_normal_temp = passenger_with_below_normal_temp.filter(
                arrival_date=today).count()
            passenger_with_above_normal_temp = passenger_with_above_normal_temp.filter(
                arrival_date=today).count()
            male_passenger_with_above_normal_temp = male_passenger_with_above_normal_temp.filter(
                arrival_date=today).count()
            female_passenger_with_above_normal_temp = female_passenger_with_above_normal_temp.filter(
                arrival_date=today).count()

            # point of entries
            for val in point_of_entries:
                poe_series_data.append(val.code)
                passengers_series_data.append(travellers.filter(
                    point_of_entry_id=val.id, arrival_date=today).count())

            # reported symptoms
            for value in symptoms:
                symptom_series_data.append(value.title)
                symptom_occurrence_data.append(
                    traveller_symptoms.filter(symptom_id=value.id, traveller__arrival_date=today).count())

        elif day == 'yesterday':
            yesterday = datetime.date.today() - datetime.timedelta(days=1)

            # queries
            total_passengers = total_passengers.filter(
                arrival_date=yesterday).count()

            allowed_to_proceed = allowed_to_proceed.filter(
                arrival_date=yesterday, action_taken_id=1).count()
            secondary_screening = secondary_screening.filter(
                arrival_date=yesterday, action_taken_id=2).count()

            passenger_with_normal_temp = passenger_with_normal_temp.filter(
                arrival_date=yesterday).count()
            passenger_with_below_normal_temp = passenger_with_below_normal_temp.filter(
                arrival_date=yesterday).count()
            passenger_with_above_normal_temp = passenger_with_above_normal_temp.filter(
                arrival_date=yesterday).count()
            male_passenger_with_above_normal_temp = male_passenger_with_above_normal_temp.filter(
                arrival_date=yesterday).count()
            female_passenger_with_above_normal_temp = female_passenger_with_above_normal_temp.filter(
                arrival_date=yesterday).count()

            # point of entries
            for val in point_of_entries:
                poe_series_data.append(val.code)
                passengers_series_data.append(travellers.filter(
                    point_of_entry_id=val.id, arrival_date=yesterday).count())

            # reported symptoms
            for value in symptoms:
                symptom_series_data.append(value.title)
                symptom_occurrence_data.append(
                    traveller_symptoms.filter(symptom_id=value.id, traveller__arrival_date=yesterday).count())

        elif day == 'last_week':
            start_at = datetime.date.today() - datetime.timedelta(days=6)
            end_at = datetime.date.today() - datetime.timedelta(days=1)

            # queries
            total_passengers = total_passengers.filter(
                arrival_date__range=[start_at, end_at]).count()

            allowed_to_proceed = allowed_to_proceed.filter(
                arrival_date__range=[start_at, end_at], action_taken_id=1).count()
            secondary_screening = secondary_screening.filter(
                arrival_date__range=[start_at, end_at], action_taken_id=2).count()

            passenger_with_normal_temp = passenger_with_normal_temp.filter(
                arrival_date__range=[start_at, end_at]).count()
            passenger_with_below_normal_temp = passenger_with_below_normal_temp.filter(
                arrival_date__range=[start_at, end_at]).count()
            passenger_with_above_normal_temp = passenger_with_above_normal_temp.filter(
                arrival_date__range=[start_at, end_at]).count()
            male_passenger_with_above_normal_temp = male_passenger_with_above_normal_temp.filter(
                arrival_date__range=[start_at, end_at]).count()
            female_passenger_with_above_normal_temp = female_passenger_with_above_normal_temp.filter(
                arrival_date__range=[start_at, end_at]).count()

            # point of entries
            for val in point_of_entries:
                poe_series_data.append(val.code)
                passengers_series_data.append(travellers.filter(
                    point_of_entry_id=val.id, arrival_date__range=[start_at, end_at]).count())

            # reported symptoms
            for value in symptoms:
                symptom_series_data.append(value.title)
                symptom_occurrence_data.append(
                    traveller_symptoms.filter(symptom_id=value.id, traveller__arrival_date__range=[start_at, end_at]).count())

        elif day == 'last_month':
            this_year = today.year
            last_month = today.month - 1

            # queries
            total_passengers = total_passengers.filter(
                arrival_date__month=last_month, arrival_date__year=this_year).count()

            allowed_to_proceed = allowed_to_proceed.filter(
                arrival_date__month=last_month, arrival_date__year=this_year, action_taken_id=1).count()
            secondary_screening = secondary_screening.filter(
                arrival_date__month=last_month, arrival_date__year=this_year, action_taken_id=2).count()

            passenger_with_normal_temp = passenger_with_normal_temp.filter(
                arrival_date__month=last_month, arrival_date__year=this_year).count()
            passenger_with_below_normal_temp = passenger_with_below_normal_temp.filter(
                arrival_date__month=last_month, arrival_date__year=this_year).count()
            passenger_with_above_normal_temp = passenger_with_above_normal_temp.filter(
                arrival_date__month=last_month, arrival_date__year=this_year).count()
            male_passenger_with_above_normal_temp = male_passenger_with_above_normal_temp.filter(
                arrival_date__month=last_month, arrival_date__year=this_year).count()
            female_passenger_with_above_normal_temp = female_passenger_with_above_normal_temp.filter(
                arrival_date__month=last_month, arrival_date__year=this_year).count()

            # point of entries
            for val in point_of_entries:
                poe_series_data.append(val.code)
                passengers_series_data.append(travellers.filter(
                    point_of_entry_id=val.id, arrival_date__month=last_month, arrival_date__year=this_year).count())

            # reported symptoms
            for value in symptoms:
                symptom_series_data.append(value.title)
                symptom_occurrence_data.append(
                    traveller_symptoms.filter(symptom_id=value.id, traveller__arrival_date__month=last_month, traveller__arrival_date__year=this_year).count())

        elif day == 'overall':
            total_passengers = total_passengers.count()

            allowed_to_proceed = allowed_to_proceed.filter(action_taken_id=1).count()
            secondary_screening = secondary_screening.filter(action_taken_id=2).count()

            passenger_with_normal_temp = passenger_with_normal_temp.count()
            passenger_with_below_normal_temp = passenger_with_below_normal_temp.count()
            passenger_with_above_normal_temp = passenger_with_above_normal_temp.count()
            male_passenger_with_above_normal_temp = male_passenger_with_above_normal_temp.count()
            female_passenger_with_above_normal_temp = female_passenger_with_above_normal_temp.count()

            # point of entries
            for val in point_of_entries:
                poe_series_data.append(val.code)
                passengers_series_data.append(
                    travellers.filter(point_of_entry_id=val.id).count())

            # reported symptoms
            for value in symptoms:
                symptom_series_data.append(value.title)
                symptom_occurrence_data.append(
                    traveller_symptoms.filter(symptom_id=value.id).count())

    else:
        # total passengers
        total_passengers = total_passengers.count()

        #allowed to process and secondary screening
        allowed_to_proceed = allowed_to_proceed.filter(action_taken_id=1).count()
        secondary_screening = secondary_screening.filter(action_taken_id=2).count()

        # total passenger with normal temp
        passenger_with_normal_temp = passenger_with_normal_temp.count()

        # total passenger with below normal temp
        passenger_with_below_normal_temp = passenger_with_below_normal_temp.count()

        # total passenger with above normal temp
        passenger_with_above_normal_temp = passenger_with_above_normal_temp.count()

        # male passengers with above temperature
        male_passenger_with_above_normal_temp = male_passenger_with_above_normal_temp.count()

        # female passengers with above temperature
        female_passenger_with_above_normal_temp = female_passenger_with_above_normal_temp.count()

        # point of entries
        for val in point_of_entries:
            poe_series_data.append(val.code)
            passengers_series_data.append(
                travellers.filter(point_of_entry_id=val.id).count())

        # reported symptoms
        for value in symptoms:
            symptom_series_data.append(value.title)
            symptom_occurrence_data.append(
                traveller_symptoms.filter(symptom_id=value.id).count())

    # male percentage
    male_percent = calc_percentage(
        male_passenger_with_above_normal_temp, passenger_with_above_normal_temp)

    # female percentage
    female_percent = calc_percentage(
        female_passenger_with_above_normal_temp, passenger_with_above_normal_temp)

    # attributes
    ctx = {
        "sidebar": True,
        "search": False,
        "total_passengers": total_passengers,
        'passenger_with_normal_temp': passenger_with_normal_temp,
        'passenger_with_below_normal_temp': passenger_with_below_normal_temp,
        'passenger_with_above_normal_temp': passenger_with_above_normal_temp,
        'male_passenger_with_above_normal_temp': male_passenger_with_above_normal_temp,
        'female_passenger_with_above_normal_temp': female_passenger_with_above_normal_temp,
        'male_percent': male_percent,
        'female_percent': female_percent,
        'secondary_screening': secondary_screening,
        'allowed_to_proceed': allowed_to_proceed,
        'poe_data': json.dumps(poe_series_data),
        'passengers_data': json.dumps(passengers_series_data),
        'symptom_data': json.dumps(symptom_series_data),
        'symptom_occurrence_data': json.dumps(symptom_occurrence_data)
    }

    return render(request, 'dashboard.html', ctx)


# calculate score
def calc_percentage(num, total):
    percent = 0

    if total > 0:
        percent = (num / total) * 100

        if percent > 0:
            if percent > 100:
                return 100
            else:
                return round(percent, 1)
        else:
            return 0
    else:
        return round(percent, 1)
