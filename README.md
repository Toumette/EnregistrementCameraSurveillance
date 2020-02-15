# Enregistrement de caméra vidéo de télésurveillance

### Script Bash pour enregistrer le flux vidéo issu d'une caméra de télésurveillance sous la forme de séquences d'une durée déterminée. Les fichiers générés au format MP4 sont horodatés.

* Réalisé et exécuté sous Linux OpenSuse Leap sur PC 64 bits.

L'environnement informatique est constitué :

1. D'un système Linux opérationnel relié au réseau local et à Internet et sur lequel l'outil "**ffmpeg**" est installé.

1. Du script "**enreg_cam.sh**" qui effectue l'enregistrement vidéo. Ce script doit pouvoir accéder au réseau local, à la caméra et au répertoire de stockage des vidéos.

1. Du paramétrage de la table "**crontab**" de l'utilisateur du système Linux pour lancer périodiquement le script "enreg_cam.sh".

1. D'un espace suffisant pour le stockage des fichiers contenant les vidéos.

---

### Contenu de la table "contab" :

    # Pas d'envoi de mail de notification :
    MAILTO=""
    # Lancement enregistrements caméra de surveillance :
    */30 19-09 * * * /home/nom_utilisateur/chemin_du_script/enreg_cam.sh 

### Explication de la ligne crontab :

    */30 => à lancer toutes les 30 mn

    19-09 => de 19h à 9h (la nuit...)

    * => tous les jours dans le mois (pas de contrôle du jour)

    * => tous les mois (pas de contrôle du mois)

    * => tous les jours de la semaine (pas de contrôle du jour de la semaine)

    /home/nom_utilisateur/chemin_du_script/enreg_cam.sh  => script à lancer en adressage absolu





---
_© Henri 15/02/20_
