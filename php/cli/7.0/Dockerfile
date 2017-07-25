################################
## Team  : Toroia             ##
## Image : php-cli:7.0        ##
################################

# Dépendance de l'image 
FROM toroia/base-debian:jessie

# Mainteneur de l'image
MAINTAINER ToroiaTeam "contact@toroia.fr"

# Ajout du dépot Dotdeb dans la liste des dépots
RUN echo "deb http://packages.dotdeb.org jessie all" > /etc/apt/sources.list.d/dotdeb.list && \
    curl -sS https://www.dotdeb.org/dotdeb.gpg | apt-key add -

# Ajout des paquets requis au fonctionnement de php
# Ajout de diverses extensions de bases
RUN apt-get update && \
    apt-get -y --no-install-recommends install \
    php7.0-cli php7.0-apcu php7.0-apcu-bc php7.0-curl php7.0-json php7.0-mcrypt php7.0-opcache php7.0-readline php7.0-xml php7.0-zip

# Ajout de l'outil Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Nettoyage des différents paquets
RUN apt-get -y -q autoclean && \
    apt-get -y -q autoremove

# Suppression des fichiers inutiles
RUN rm -Rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/* ~/.composer

# Démarrage de PHP CLI
CMD ["php", "-a"]
