from django.shortcuts import render

# Create your views here.

def hello(request):
    return render(request, "welcome/index.html")
