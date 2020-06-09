from django.shortcuts import render
from .models import *
from modules.travellers.models import Traveller, Disease
from modules.common.models import *
from django.db.models import Q
from .forms import RiskAssessmentForm

# Create your views here.

def risk_assessment(request, travellers_id): 
    # create object of form 
    instance    = RiskAssessment.objects.filter(traveller_id=travellers_id).first()
    form        = RiskAssessmentForm(request.POST, instance=instance) 

    travellers          = Traveller.objects.select_related('location_origin').get(pk=travellers_id)
    disease_to_screen   = travellers.disease_to_screen.split(",")
    diseases            = Disease.objects.filter(pk__in=disease_to_screen).values()
      
    # check if form data is valid 
    if form.is_valid(): 
        action              = form.save(commit=False)
        action.traveller_id = travellers_id
        action.user_id      = 1
        action.save() 
  
    context = {
        "modules"   : Module.objects.all(),
        "form"      : form,
        "travellers": travellers,
        "diseases"  : diseases
    }
    return render(request, "risk_assessment.html", context)


def screen_list(request):
    travellers  =   (Traveller.objects
                            .select_related('location_origin')
                            .filter(~Q(disease_to_screen=0))
                            .values('id','full_name', 'id_number','temp', 'name_of_transport', 'disease_to_screen','location_origin__title')
                    )
    
    context = {
        "modules": Module.objects.all(),
        "travellers": travellers
    }
    return render(request, 'screen_list.html', context)

def screen_traveller(request, travellers_id):

    travellers          = Traveller.objects.select_related('location_origin').get(pk=travellers_id)
    disease_to_screen   = travellers.disease_to_screen.split(",")
    diseases            = Disease.objects.filter(pk__in=disease_to_screen).values()

    context = {
        "modules": Module.objects.all(),
        "travellers": travellers,
        "diseases": diseases
    }

    return render(request, 'screen_traveller.html', context)



def survey(request, travellers_id, disease_id):

    if request.method == "POST":
        for qn_id, ans in request.POST.items():
            survey_ans                  = DiseaseSurveyAns()
            survey_ans.disease_id       = disease_id
            survey_ans.traveller_id     = travellers_id
            if qn_id != 'csrfmiddlewaretoken':
                #print(qn_id+ans)
                survey_ans.question_id  = qn_id
                survey_ans.title        = ans
                survey_ans.save()
        form_submitted      = True
    else:
        form_submitted      = False
    
    questions           = DiseaseSurveyQns.objects.filter(disease_id=disease_id)
    travellers          = Traveller.objects.select_related('location_origin').get(pk=travellers_id)
    disease_to_screen   = travellers.disease_to_screen.split(",")
    diseases            = Disease.objects.filter(pk__in=disease_to_screen).values()

    context = {
        "modules"       : Module.objects.all(),
        "travellers"    : travellers,
        "diseases"      : diseases,
        'questions'     : questions,
        "form_submitted": form_submitted,
    }
    return render(request,'screen_traveller.html',context)