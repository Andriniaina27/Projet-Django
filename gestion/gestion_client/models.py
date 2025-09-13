from django.db import models
from django.contrib.auth.models import User
from django.utils import timezone


class Client(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)  # Relation 1-1 avec User
    numero_tel = models.CharField(max_length=13)
    cin = models.CharField(max_length=12)
    date_naissance = models.DateField()
    photo = models.ImageField(upload_to='clients/', null=True, blank=True)
    last_activity = models.DateTimeField(default=timezone.now)

    def __str__(self):
        return self.user.username



class TypeForfait(models.Model):
    type_forfait = models.CharField(max_length=100)
    desc_forfait = models.CharField(max_length=255)

    def __str__(self):
        return self.type_forfait



class Forfait(models.Model):
    type_forfait = models.ForeignKey(TypeForfait, on_delete=models.CASCADE)
    nom = models.CharField(max_length=255)
    data_mo = models.IntegerField()
    minutes = models.IntegerField(default=0)
    sms = models.IntegerField(default=0)
    prix = models.DecimalField(max_digits=6, decimal_places=2)
    duree_jours = models.IntegerField()

    def __str__(self):
        return self.nom


class Abonnement(models.Model):
    client = models.ForeignKey(Client, on_delete=models.CASCADE)
    forfait = models.ForeignKey(Forfait, on_delete=models.CASCADE)
    date_debut = models.DateField(auto_now_add=True)
    date_fin = models.DateField()
    est_actif = models.BooleanField(default=True)

    def __str__(self):
        return f"{self.client.user.username} - {self.forfait.nom}"

    def est_encore_valide(self):
        # """Retourne True si l’abonnement n’est pas expiré"""
        return self.date_fin >= timezone.now().date()


# Create your models here.
