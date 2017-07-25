##################################
## Team  : Toroia               ##
## Image : websrv-nginx:phalcon ##
##################################


# Dépendance de l'image 
FROM toroia/websrv-nginx:html

# Mainteneur de l'image
MAINTAINER ToroiaTeam "contact@toroia.fr"

# Variable d'environnement pour serveur PHP
ENV PHPSRV php-phalcon

# Suppression des fichier de configuration par défaut
# Création du dossier public de Phalcon
RUN rm -f /etc/nginx/conf.d/default.conf && \
    rm -f /etc/nginx/conf.d/ssl.conf && \
    rm -f /etc/nginx/common.conf && \
    mkdir -p /www/public

# Ajout des fichiers de configurations pour Phalcon
COPY common.conf /etc/nginx/common.conf
COPY conf.d/default.conf /etc/nginx/conf.d/default.conf
COPY conf.d/ssl.conf /etc/nginx/conf.d/ssl.conf

# Changement des droits du dossier de Nginx
RUN chown -R nginx:www-data /var/lib/nginx
