from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
from django.views.decorators.cache import never_cache
from django.contrib import messages
from datetime import date, datetime
from django.utils import timezone
from django.contrib.auth.hashers import make_password
import locale
from .models import Forfait, TypeForfait, Client, Abonnement, User


def connexion(request):
    if request.method == 'POST':
        email = request.POST['email']
        password = request.POST['password']
        user = authenticate(request, username = email, password = password)
        if user:
            login(request, user)
            if user.is_superuser == True:
                return redirect('dashboard')
            else:
                return redirect('home')
        else:
            messages.error(request, "Echec d'authentification")
    return render(request, 'login.html')

def inscription(request):
    # user = User()
    if request.method == 'POST':
        nom = request.POST['nom'].strip()
        prenom = request.POST['prenom'].strip()
        email = request.POST['email'].strip()
        tel = request.POST['tel'].strip()
        datenais = request.POST['datenais'].strip()
        cin = request.POST['cin'].strip()
        password = request.POST['password'].strip()
        conf_password = request.POST['conf_password'].strip()

        if not nom or not prenom or not email or not tel or not datenais or not cin or not password or not conf_password:
            messages.error(request, "Veuillez remplir les champs vides")
            redirect('register')
        if password != conf_password:
            messages.error(request, "Les mots de passe ne correspondent pas.")
            return redirect("register")

        # Vérification si email déjà utilisé
        if User.objects.filter(email=email).exists():
            messages.error(request, "Cet email est déjà utilisé.")
            return redirect("register")

        user = User.objects.create_user(
            username=nom,
            first_name=prenom,
            email=email,
            password=password
        )

        Client.objects.create(
            user=user,
            numero_tel=tel,
            cin=cin,
            date_naissance=datenais,
            last_activity=timezone.now()
        )

        messages.success(request, "Inscription réussie ! Vous pouvez maintenant vous connecter.")
        return redirect("login")
    return render(request, 'register.html')

def deconnexion(request):
    logout(request)
    return redirect('login')

@never_cache
@login_required(login_url='login')
def dashboard(request):
    locale.setlocale(locale.LC_TIME, 'french')
    now = date.today()
    date_now = now.strftime('%A %d %B %Y')
    countForfait = Forfait.objects.count()
    countClient = Client.objects.count()
    context = {
        'date_now' : date_now,
        'countForfait' : countForfait,
        'countClient' : countClient,
    }
    return render(request, 'admin_gestion/dashboard.html', context)

@never_cache
@login_required(login_url='login')
def abonnement(request):
    return render(request, 'admin_gestion/abonnement.html')

@never_cache
@login_required(login_url='login')
def forfait(request):
    type_forfait = TypeForfait.objects.all()
    if request.method == 'POST':
        nom = request.POST['nom'].strip()
        data = request.POST['data'].strip()
        appel = request.POST['appel'].strip()
        sms = request.POST['sms'].strip()
        prix = request.POST['prix'].strip()
        duree = request.POST['duree'].strip()
        type = request.POST['type'].strip()

        if not nom or not type:
            messages.error(request, "Veuillez remplir les champs vides")
            return redirect('forfait')
        
        if type == "1":
            if not nom or not type or not data or not appel or not sms or not prix or not duree:
                messages.error(request, "Veuillez remplir les champs vides")
                return redirect('forfait')
        elif type == "2":
            appel = 0
            sms = 0
        
        forfait = Forfait( nom = nom, data_mo = data, minutes = appel, sms = sms, prix = prix, duree_jours = duree, type_forfait_id = type)
        forfait.save()
        return redirect('listForfait')
    context = {
        'type_forfait' : type_forfait,
    }
    return render(request, 'admin_gestion/forfait.html', context)
@never_cache
@login_required(login_url='login')
def listForfait(request):
    forfait =  Forfait.objects.select_related('type_forfait')
    context = {
        'forfait' : forfait,
    }
    return render(request, 'admin_gestion/list_forfait.html', context)

@never_cache
@login_required(login_url='login')
def deleteForfait(request, id):
    forfait = Forfait.objects.get(id = id)
    if forfait:
        forfait.delete()
        return redirect('listForfait')
    return render(request, 'admin_gestion/list_forfait.html')

@never_cache
@login_required(login_url='login')
def updateForfait(request, id):
    forfait = Forfait.objects.get(id = id)
    type_forfait = TypeForfait.objects.all()
    context = {
        'forfait' : forfait,
        'type_forfait' : type_forfait,
    }
    if request.method == 'POST':
        nom = request.POST['nom'].strip()
        data = request.POST['data'].strip()
        appel = request.POST['appel'].strip()
        sms = request.POST['sms'].strip()
        prix = request.POST['prix'].strip()
        duree = request.POST['duree'].strip()
        type = request.POST['type'].strip()

        if not nom or not type:
            messages.error(request, "Veuillez remplir les champs vides")
            return redirect('forfait')
        
        if type == "1":
            if not nom or not type or not data or not appel or not sms or not prix or not duree:
                messages.error(request, "Veuillez remplir les champs vides")
                return redirect('forfait')
        elif type == "2":
            appel = 0
            sms = 0
        forfait.nom = nom
        forfait.data_mo = data 
        forfait.minutes = appel 
        forfait.sms = sms
        forfait.prix = prix
        forfait.duree_jours = duree 
        forfait.type_forfait_id = type
        forfait.save()
        return redirect('listForfait')
    return render(request, 'admin_gestion/modif_forfait.html', context)


@never_cache
@login_required(login_url='login')
def list_client(request):
    client = Client.objects.select_related('user')
    context = {
        'client': client
    }
    return render(request, 'admin_gestion/list_client.html', context)


@never_cache
@login_required(login_url='login')
def home(request):
    locale.setlocale(locale.LC_TIME, 'french')
    now = date.today()
    date_now = now.strftime('%A %d %B %Y')
    context = {
        'date_now' : date_now
    }
    return render(request, "client/dashboard.html", context)

@never_cache
@login_required(login_url='login')
def facture(request):
    locale.setlocale(locale.LC_TIME, 'french')
    now = date.today()
    date_now = now.strftime('%A %d %B %Y')
    context = {
        'date_now' : date_now
    }
    return render(request, "client/facture.html", context)

@never_cache
@login_required(login_url='login')
def profil(request):
    locale.setlocale(locale.LC_TIME, 'french')
    now = date.today()
    date_now = now.strftime('%A %d %B %Y')
    context = {
        'date_now' : date_now
    }
    return render(request, "client/profil.html", context)

# Create your views here.
