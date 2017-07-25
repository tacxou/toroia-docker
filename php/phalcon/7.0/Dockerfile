################################
## Team  : Toroia             ##
## Image : php-phalcon:7.0    ##
################################

# Dépendance de l'image 
FROM toroia/php-fpm:7.0

# Mainteneur de l'image
MAINTAINER ToroiaTeam "contact@toroia.fr"

# Ajout de la variable d'environnement de dépendances optionnelle
ENV DEPENDENCIES "php7.0-xdebug"

# Installation des dépendances
RUN apt-get update && \
    apt-get -y --no-install-recommends install php7.0-memcached php7.0-gd php7.0-imagick php7.0-mbstring php7.0-xdebug

# Installation des dépendances optionnelles
RUN apt-get -y --no-install-recommends install ${DEPENDENCIES}

# Installation de Phalcon
RUN curl -s https://packagecloud.io/install/repositories/phalcon/stable/script.deb.sh | bash && \
    apt-get install -y php7.0-phalcon

# Nettoyage des paquets
RUN apt-get -y -q autoclean && \
    apt-get -y -q autoremove

# Suppression des fichiers inutiles
RUN rm -Rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*
