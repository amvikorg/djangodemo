from django.urls import path
from welcome import views

urlpatterns = [
    path("",view=views.hello)
]
