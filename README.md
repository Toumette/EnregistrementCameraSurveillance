# Enregistrement de caméra vidéo de télésurveillance

### Script Bash pour enregistrer le flux vidéo issu de caméras de télésurveillance sous la forme de séquences d'une durée déterminée. Les fichiers générés sont horodatés.

* Réalisé et exécuté sous Linux OpenSuse Leap sur PC 64 bits.

L'environnement informatique est constitué :

1. D'un système Linux opérationnel relié au réseau local et à Internet et sur lequel l'outil ffmpeg est installé.

1. Du script "enreg_cam.sh" qui effectue l'enregistrement vidéo. Ce script doit pouvoir accéder au réseau local, à la caméra et au répertoire de stockage des vidéos.

1. Du paramétrage de la table "crontab" du système Linux pour lancer périodiquement le script "enreg_cam.sh".

1. D'un espace suffisant pour le stockage des fichiers contenant les vidéos.
