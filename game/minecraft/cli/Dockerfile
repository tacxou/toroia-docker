##################################
## Team  : Toroia               ##
## Image : game-minecraft:cli   ##
##################################


# Dépendance de l'image 
FROM toroia/base-ubuntu:xenial

# Mainteneur de l'image
MAINTAINER ToroiaTeam "contact@toroia.fr"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-add-repository --yes ppa:webupd8team/java; apt-get --yes update

RUN    echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections  && \
       echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections  && \
       apt-get -y install oracle-java8-installer ;

RUN mkdir -p /opt/minecraft/data && \
    mkdir -p /opt/minecraft/scripts

COPY minecraft.sh /opt/minecraft/scripts/minecraft.sh

RUN chmod +x /opt/minecraft/scripts/minecraft.sh

EXPOSE 25565

VOLUME ["/data"]

CMD ["/opt/minecraft/scripts/minecraft.sh"]
