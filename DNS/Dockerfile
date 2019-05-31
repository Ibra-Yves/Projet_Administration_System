#version utilisé
FROM ubuntu

#mettre à jour / ne pas travailler en interface
#gnupg permet la transmission de messages électroniques signés et chiffrés
RUN apt-get update
 && DEBIAN_FRONTEND=noninteractive apt-get install -y gnupg \
 && apt-key adv --fetch-keys http://www.webmin.com/jcameron-key.asc \
 && apt-get nano
 && echo "deb http://download.webmin.com/download/repository sarge contrib" >> /etc/apt/sources.list

#on copie les clés téléchargées "trusted.gpg" 
COPY --from=add-apt-repositories /etc/apt/trusted.gpg /etc/apt/trusted.gpg

COPY --from=add-apt-repositories /etc/apt/sources.list /etc/apt/sources.list

#effacer les repertoires et les fichiers 
RUN rm -rf /etc/apt/apt.conf.d/docker-gzip-indexes \
 && apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
      bind9=1:${BIND_VERSION}* bind9-host=1:${BIND_VERSION}* dnsutils \
      webmin=${WEBMIN_VERSION}* \
 && rm -rf /var/lib/apt/lists/*


COPY entrypoint.sh /sbin/entrypoint.sh

#modification des permissions 
RUN chmod 755 /sbin/entrypoint.sh

EXPOSE 53/udp 53/tcp 

CMD ["/usr/sbin/named"]
