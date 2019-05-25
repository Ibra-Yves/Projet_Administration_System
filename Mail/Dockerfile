FROM UBUNTU

RUN apt-get update -y  \
&& DEBIAN_FRONTEND=noninteractive apt-get -y -q 
&& install dovecot-common dovecot-imapd
&&install postfix mailutils  -y
&& apt-get -y install nano
&&rm /etc/postfix/main.cf
&&rm /etc/dovecot/conf.d/10-ssl.conf
&&rm /etc/dovecot/conf.d/10-master.conf
&&rm /etc/dovecot/conf.d/10-mail.conf
&&rm /etc/dovecot/conf.d/10-auth.conf
&&adduser contact
COPY ./main.cf /etc/postfix/
COPY ./10-ssl.conf /etc/dovecot/conf.d/
COPY ./10-master.conf /etc/dovecot/conf.d/
COPY ./10-mail.conf /etc/dovecot/conf.d/
COPY ./10-mail.conf /etc/dovecot/conf.d/



EXPOSE 25 143 993 110 995 
CMD service dovecot restart && service postfix restart
