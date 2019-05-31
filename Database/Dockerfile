#image Ubuntu
FROM UBUNTU


#creation de groupe / ajouter un utilisateur
RUN groupadd -r mysql && useradd -r -g mysql mysql

#mise à jour du container et suppression des repertoires et fichiers
RUN apt-get update && apt-get install -y --no-install-recommends gnupg dirmngr && rm -rf /var/lib/apt/lists/*


RUN mkdir /docker-entrypoint-initdb.d

#mise à jour et precision sur les paquets qui seront installés
RUN apt-get update && apt-get install -y --no-install-recommends \
		openssl \
		perl \
	&& rm -rf /var/lib/apt/lists/*


ENV MYSQL_MAJOR 8.0
ENV MYSQL_VERSION 8.0.16-1debian9

RUN echo "deb http://repo.mysql.com/apt/debian/ stretch mysql-${MYSQL_MAJOR}" > /etc/apt/sources.list.d/mysql.list

RUN { \
		echo mysql-community-server mysql-community-server/data-dir select ''; \
		echo mysql-community-server mysql-community-server/root-pass password ''; \
		echo mysql-community-server mysql-community-server/re-root-pass password ''; \
		echo mysql-community-server mysql-community-server/remove-test-db select false; \
	} | debconf-set-selections \
	&& apt-get update && apt-get install -y mysql-community-client="${MYSQL_VERSION}" mysql-community-server-core="${MYSQL_VERSION}" && rm -rf /var/lib/apt/lists/* \
	&& rm -rf /var/lib/mysql && mkdir -p /var/lib/mysql /var/run/mysqld \
	&& chown -R mysql:mysql /var/lib/mysql /var/run/mysqld \
	&& chmod 777 /var/run/mysqld

VOLUME /var/lib/mysql
COPY config/ /etc/mysql/
COPY docker-entrypoint.sh /usr/local/bin/
RUN ln -s usr/local/bin/docker-entrypoint.sh /entrypoint.sh # backwards compat
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 3306 
CMD ["mysqld"]
