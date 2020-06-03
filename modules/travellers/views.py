from django.shortcuts import render
from .forms import TravellerForm
from django.contrib import messages


def default(request):
    return render(request, 'travellers/home.html', {})


def international(request):
    form = TravellerForm()
    context = {
        "form": form
    }
    if request.method == 'POST':
        if form.is_valid():
            obj = form.save(commit=False)
            obj.type = "international"
            obj.save()
            messages.add_message(request, messages.SUCCESS, 'Success! Saved Successfully!')
            return render(request, 'travellers/international.html', context)
        else:
            messages.add_message(request, messages.WARNING, 'Warning! Please check all the fields!')
    return render(request, 'travellers/international.html', context)


def domestic(request):
    return render(request, 'travellers/domestic.html', {})
