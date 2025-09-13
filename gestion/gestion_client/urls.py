from django.urls import path
from . import views 


urlpatterns = [
    path('', views.connexion, name='login'),
    path('dashboard/', views.dashboard, name='dashboard'),
    path('logout/', views.deconnexion, name='logout'),
    path('abonnement/', views.abonnement, name='abonnement'),
    path('register/', views.inscription, name='inscription'),
    path('list_forfaits/', views.listForfait, name='listForfait'),
    path('list_forfaits/delete/<int:id>', views.deleteForfait, name='delete'),
    path('list_forfaits/update/<int:id>', views.updateForfait, name='update'),
    path('forfait/', views.forfait, name='forfait'),
    path('list_client/', views.list_client, name='listClient'),
]