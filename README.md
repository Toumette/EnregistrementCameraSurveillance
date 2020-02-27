# Enregistrement de caméra vidéo de télésurveillance

### Script Bash pour enregistrer le flux vidéo issu d'une caméra de télésurveillance sous la forme de séquences d'une durée déterminée. Les fichiers générés au format MP4 sont horodatés.

_Script initialement réalisé pour surveiller l'activité nocturne des hérissons que je nourris et abrite pour l'hiver dans mon jardin ! **Voir les détails sur mon site.**_

* Réalisé et exécuté sous Linux OpenSuse Leap sur PC 64 bits.

L'environnement informatique est constitué :

1. D'un système Linux opérationnel relié au réseau local et à Internet et sur lequel l'outil "**ffmpeg**" est installé (ne pas mettre l'ordinateur en veille).

1. Du script "**enreg_cam.sh**" qui effectue l'enregistrement vidéo. Ce script doit pouvoir accéder au réseau local, à la caméra et au répertoire de stockage des vidéos.

1. Du paramétrage de la table "**crontab**" de l'utilisateur du système Linux pour lancer périodiquement le script "enreg_cam.sh".

1. D'un espace suffisant pour le stockage des fichiers contenant les vidéos, en local ou sur un périphérique externe de stockage préalablement monté sur le système.

---

## Lancement périodique par CRON

#### Contenu de la table "crontab" :

    # Pas d'envoi de mail de notification :
    MAILTO=""
    # Lancement enregistrements caméra de surveillance des hérissons pour des séquences de 30 mn,
    # toute la nuit :
    */30 19,20,21,22,23,0,1,2,3,4,5,6,7,8 * * * /home/nom_utilisateur/chemin_du_script/enreg_cam.sh

#### Explication de la ligne crontab :

    */30 => à lancer toutes les 30 mn

    19,20,21,22,23,0,1,2,3,4,5,6,7,8 => de 19h à 9h (toutes les heures de nuit...)

    * => tous les jours dans le mois (pas de contrôle du jour)

    * => tous les mois (pas de contrôle du mois)

    * => tous les jours de la semaine (pas de contrôle du jour de la semaine)

    /home/nom_utilisateur/chemin_du_script/enreg_cam.sh  => script à lancer en adressage absolu

#### Création de la crontab de l'utilisateur :

Veiller à ne **jamais éditer directement la crontab** mais passer par les commandes suivantes (en mode console) :

    crontab -l => pour lister le contenu de la contab
    crontab -e  => pour éditer le contenu de la contab (et la créer, si elle n'existe pas)
    crontab -r  => pour supprimer (pas de confirmation !!!) le contenu de la contab (et la table elle-même)
---

## Extraction des séquences vidéo mises en ligne

J'ai utilisé également "**ffmpeg**" en ligne de commande :

    ffmpeg -i nom_du_fichier_de_30mn.mp4 -ss h1:m1:s1 -t h2:m2:s2 -c copy extrait1.mp4

Avec :
h1:m1:s1 : instant du début de la séquence à extraire heure:minute:seconde (dans la vidéo)
h2:m2:s2 : durée de la séquence à extraire

---
_NB : Le script ci-joint est très commenté_
_© Henri 15/02/20_
