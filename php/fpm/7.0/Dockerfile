################################
## Team  : Toroia             ##
## Image : php-fpm:7.0        ##
################################

# Dépendance de l'image 
FROM toroia/php-cli:7.0

# Mainteneur de l'image
MAINTAINER ToroiaTeam "contact@toroia.fr"

# Installation de PHP FPM
RUN apt-get update && \
    apt-get -y --no-install-recommends install php7.0-fpm && \
    apt-get -y -q autoclean && \
    apt-get -y -q autoremove

# Suppression des fichiers inutiles
RUN rm -Rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

# Ajout des permissions
RUN usermod -u 1000 www-data

# Ajout de plusieurs paramètres à PHP FPM
COPY overrides.conf /etc/php/7.0/fpm/pool.d/z-overrides.conf

# Copie du script de démarrage PHP FPM
COPY php-fpm /usr/bin/php-fpm
RUN chmod 770 /usr/bin/php-fpm

# Démarrage de PHP FPM
CMD /usr/bin/php-fpm

# Exposition du port PHP FPM
EXPOSE 9000
