from django.shortcuts import render
from .models import *
from modules.travellers.models import *
from django.db.models import Q
from datetime import datetime, date
from .forms import RiskAssessmentForm
from django.contrib.auth.decorators import login_required


# Create your views here.

@login_required
def risk_assessment(request, travellers_id): 
    # create object of form 
    instance            = RiskAssessment.objects.filter(traveller_id=travellers_id).first()

    traveller           = Traveller.objects.select_related('location_origin').get(pk=travellers_id)
    disease_to_screen   = traveller.disease_to_screen.split(",")
    diseases            = Disease.objects.filter(pk__in=disease_to_screen).values()

    fields              = traveller.__dict__
    

    if request.method   == "POST":
        form        = RiskAssessmentForm(request.POST, instance=instance) 
        if form.is_valid(): 
            action              = form.save(commit=False)
            action.traveller_id = travellers_id
            action.user_id      = 1
            action.save()
            form_submitted      = True
    else:
        form        = RiskAssessmentForm(instance=instance)
        form_submitted      = False
    
    context = {
        "form"      : form,
        "traveller" : fields,
        "travellers": traveller,
        "diseases"  : diseases,
        "form_submitted": form_submitted,
    }

    return render(request, "risk_assessment.html", context)

@login_required
def traveller_info(request, travellers_id): 

    traveller           = Traveller.objects.select_related('nationality','region','location_origin', 'point_of_entry').get(pk=travellers_id)
    disease_to_screen   = traveller.disease_to_screen.split(",")
    diseases            = Disease.objects.filter(pk__in=disease_to_screen).values()
    symptoms            = Traveller.symptoms.through.objects.filter(traveller_id=travellers_id).values("symptom__title")
    visited_countries   = TravellerVisitedArea.objects.select_related('location').filter(traveller_id=travellers_id).values("location__title", "location_visited", "days", "date")

    fields              = traveller.__dict__

    context = {
        "traveller" : traveller,
        "travellers": traveller,
        "diseases"  : diseases,
        "symptoms"  : symptoms,
        "countries" : visited_countries,
        "search"    : False,
    }
    return render(request, "travellers_info.html", context)


@login_required
def screen_list(request):

    poe_id = request.session.get('poe_id')

    travellers  =   (Traveller.objects
                            .select_related('location_origin')
                            .filter(~Q(disease_to_screen=0),Q(arrival_date=date.today(),))
                            .values('id','other_names', 'surname', 'nationality__title' ,'id_number','age_category', 'age', 'sex','temp', 'name_of_transport', 'disease_to_screen','location_origin__title')
                    )
    if poe_id:
        travellers  = travellers.filter(Q(point_of_entry_id=poe_id))
    
    context = {
        "travellers": travellers
    }
    return render(request, 'screen_list.html', context)


@login_required
def screen_traveller(request, travellers_id):

    traveller           = Traveller.objects.select_related('location_origin').get(pk=travellers_id)
    disease_to_screen   = traveller.disease_to_screen.split(",")
    diseases            = Disease.objects.filter(pk__in=disease_to_screen).values()
    fields              = traveller.__dict__

    context = {
        "traveller"     : fields,
        "travellers": traveller,
        "diseases": diseases
    }

    return render(request, 'screen_traveller.html', context)


@login_required
def survey(request, travellers_id, disease_id):
  
    questions           = DiseaseSurveyQns.objects.filter(disease_id=disease_id)
    answers             = DiseaseSurveyAns.objects.filter(disease_id=disease_id,traveller_id=travellers_id).values('id','question_id','title')
    traveller           = Traveller.objects.select_related('location_origin').get(pk=travellers_id)
    disease_to_screen   = traveller.disease_to_screen.split(",")
    diseases            = Disease.objects.filter(pk__in=disease_to_screen).values()
    fields              = traveller.__dict__

    # tuple for storing answers if any
    ans_list            = {}
    for ans in answers:
        question_id     = ans['question_id']
        title           = ans['title']
        ans_list[question_id]   = title

    
    #print(answers)
    if request.method == "POST":
        for qn_id, ans in request.POST.items():
            survey_ans                  = DiseaseSurveyAns()
            survey_ans.disease_id       = disease_id
            survey_ans.traveller_id     = travellers_id

            if qn_id != 'csrfmiddlewaretoken':
                DiseaseSurveyAns.objects.update_or_create(
                    disease_id=disease_id,traveller_id=travellers_id,question_id=qn_id,
                    defaults={'question_id':qn_id,'title':ans}
                )
           
        form_submitted      = True
    else:
        form_submitted      = False

    context = {
        "traveller"     : fields,
        "travellers"    : traveller,
        "diseases"      : diseases,
        'questions'     : questions,
        'answers'       : ans_list,
        "form_submitted": form_submitted,
    }
    return render(request,'screen_traveller.html',context)
