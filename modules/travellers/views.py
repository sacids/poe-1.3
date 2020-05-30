from django.shortcuts import render


def default(request):
    ctx = {
        "hello": "world"
    }
    return render(request, 'travellers/index.html', ctx)


def domestic(request):
    ctx = {
        "hello": "world"
    }
    return render(request, 'travellers/domestic.html', ctx)


def international(request):
    ctx = {
        "hello": "world"
    }
    return render(request, 'travellers/international.html', ctx)
