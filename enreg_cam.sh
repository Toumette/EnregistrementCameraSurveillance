#!/bin/bash
# enreg_cam.sh
# -----------------------------------------------------------------------------
# Enregistre le flux vidéo issu d'une caméra D-LINK DCS 5020L
# Crée un fichier d'une durée paramétrable et lui donne un mom intégrant
# l'horodatage - N'enregistre que la vidéo
# -----------------------------------------------------------------------------
# Script original de @LucaTNT francisé et modifié par mes soins pour mes besoins
# lien vers la page de l'auteur du script original :
# https://lucatnt.com/2014/08/record-and-archive-video-from-ip-cameras/
# -----------------------------------------------------------------------------
# Décommenter la ligne ci-dessous si problème de fichiers
# enregistrés avec une taille nulle - ceci peut arriver avec des caméras bas de
# gamme. Dans ce cas, "killall -INT" simule une interruption utilisateur (ctrl-C)
# ce qui arrête proprement ffmpeg qui, du coup, écrit un fichier utilisable
# Pour les explications, voir :
# https://lucatnt.com/2014/08/record-and-archive-video-from-ip-cameras/#comment-48019

# killall -INT ffmpeg


# -----------------------------------------------------------------------------
# Création de la variable "nom de fichier" avec horodatage "année-mois-jours_heure.minute"
# exemple de nom de fichier créé : "camera1_2020-02-06_18.26"

name="camera1_`date +%Y-%m-%d_%H.%M`"


# -----------------------------------------------------------------------------
# Création de la variable "répertoire" où seront enregistrées les séquences vidéo :

rec_path='/home/nom_utilisateur/répertoire_de_rangement_des_vidéos'


# -----------------------------------------------------------------------------
# Lancement de ffmpeg pour sauvegarder le flux vidéo
# pour une séquence d'une durée de 30 minutes (360*5=1800 s) :

ffmpeg  -i http://"nom_utilisateur_camera":"mot_de_passe_camera"@adresseIPcamera:80/video.cgi \
        -vcodec copy -an -t 360 \
        $rec_path/cam01/$name.mp4 \
        0</dev/null \
        1>/dev/null \
        2>$rec_path/cam01/$name.logs &


# Précisions sur les paramètres utilisés par ffmpeg :
# ---------------------------------------------------
# -i http://"nom_utilisateur_camera":"mot_de_passe_camera"@adresseIPcamera:80/video.cgi =
# données envoyées en entrée de ffmpeg, soit : 
# données de connexion camera + adresse IP camera + port camera + nom du service de la caméra délivrant le flux vidéo

# -vcodec copy = enregistre le flux vidéo sans le réencoder (le codec video fait juste la copie)

# -an = pas d'inclusion d'audio dans le flux enregistré (1 seul flux)

# -t 360 = enregistre durant 360*5=1800 secondes soit 30 minutes

# $rec_path/cam01/$name.mp4 = précise le répertoire + le nom du fichier + le format du fichier
# de la vidéo enregistrée

# 0</dev/null = rien n'est envoyé sur l'entrée standard (l'entrée de ffmpeg est précisée par le "-i xxx")

# 1>/dev/null = ne fait rien des informations venant de la sortie standard (mode "silencieux")

# 2>$rec_path/cam01/$name.logs = crée un fichier log horodaté
# utile pour débogage... peut être supprimé ensuite par : 2>/dev/null

# & = lance le processus ffmpeg en arrière plan - surtout utile si on doit
# lancer plusieurs instances de ffmpeg pour enregistrer les flux de plusieurs
# caméras simultanément


# -----------------------------------------------------------------------------
# Décommenter la ligne ci-dessous pour tester le bon lancement du script par CRON
# Cette commande écrit simplement la date dans un fichier "test_cron" placé
# dans le répertoire des vidéos avec ajout d'une nouvelle ligne à chaque exécution :

# date >> $rec_path/cam01/test_cron

