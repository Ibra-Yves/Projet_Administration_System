FROM ubuntu
RUN apt-get update && apt-get install -y bind9

WORKDIR /etc/bind

VOLUME /etc/bind
EXPOSE 53/udp 53/tcp
CMD ["usr/sbin/named"]
