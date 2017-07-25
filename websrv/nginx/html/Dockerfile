#################################
## Team  : Toroia              ##
## Image : websrv-nginx:alpine ##
#################################


# Dépendance de l'image 
FROM alpine:latest

# Définition de la variable d'environnement TIMEZONE
ENV TIMEZONE Europe/Paris

# Mainteneur de l'image
MAINTAINER ToroiaTeam "contact@toroia.fr"

# Mise à jour du système
# Installation de Nginx OpenSSL et Tzdata
# Configuration de la timezone
RUN apk update && \
    apk upgrade && \
    apk add --update openssl nginx tzdata && \
    cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && \
    echo "${TIMEZONE}" > /etc/timezone

# Génération des dossiers et certificats SSL
RUN mkdir /etc/nginx/certificates && \
    openssl req -x509 -newkey rsa:2048 \
    -keyout /etc/nginx/certificates/key.pem \
    -out /etc/nginx/certificates/cert.pem \
    -days 365 \
    -nodes \
    -subj /CN=localhost

# Création du dossier www
# Supression de tzdata
# Vidage du cache apk
RUN mkdir /www && \
    apk del tzdata && \
    rm -rf /var/cache/apk/*

# Changement des droits du dossier de Nginx
# Application des liens symboliques vers les logs
# Copie si non existant du fichier index.html par défaut
RUN chown -R nginx:www-data /var/lib/nginx && \
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log && \
    false | cp -i /var/lib/nginx/html/index.html /www/index.html

# Ajout des fichiers de configuration de Nginx
COPY nginx.conf /etc/nginx/nginx.conf
COPY common.conf /etc/nginx/common.conf
COPY conf.d/default.conf /etc/nginx/conf.d/default.conf
COPY conf.d/ssl.conf /etc/nginx/conf.d/ssl.conf

# Ajout des volumes à mapper
VOLUME ["/etc/nginx/conf.d", "/var/log/nginx", "/www"]

# Exposition des ports de l'image
EXPOSE 80 443

# Configuration du point d'entrer
ENTRYPOINT ["/usr/sbin/nginx", "-g" , "daemon off;"]
