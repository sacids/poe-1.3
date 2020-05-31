from django.shortcuts import render


# Create your views here.
def default(request):
    return render(request, 'travellers/home.html', {})


def international(request):
    return render(request, 'travellers/international.html', {})


def domestic(request):
    return render(request, 'travellers/domestic.html', {})
