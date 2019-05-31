#image utilisé pour fabriquer la nouvelle
FROM debian

#va exécuter toutes les commandes qui sont ci-dessous
RUN apt update && apt upgrade -y 
RUN apt install -y \
  wget \
  vim
 
#le répertoire de travail 
WORKDIR /usr/local/src/

#installation d'Asterisk
RUN wget https://downloads.asterisk.org/pub/telephony/asterisk/asterisk-14.4.0.tar.gz
RUN tar -xzf asterisk-14.4.0.tar.gz
WORKDIR /usr/local/src/asterisk-14.4.0


RUN ./configure
RUN make
RUN make install 
RUN make samples

VOLUME /etc/asterisk

#Ports exposés
EXPOSE 5060/udp
EXPOSE 5060/tcp
EXPOSE 4569/udp
EXPOSE 16384-16394/udp

CMD ["asterisk", "-f"]
