FROM debian

RUN apt update && apt upgrade -y 
RUN apt install -y \
  wget \
  vim
  
WORKDIR /usr/local/src/

RUN wget https://downloads.asterisk.org/pub/telephony/asterisk/asterisk-14.4.0.tar.gz
RUN tar -xzf asterisk-14.4.0.tar.gz
WORKDIR /usr/local/src/asterisk-14.4.0

RUN ./configure
RUN make
RUN make install 
RUN make samples

VOLUME /etc/asterisk

EXPOSE 5060/udp
EXPOSE 5060/tcp
EXPOSE 4569/udp
EXPOSE 16384-16394/udp

CMD ["asterisk", "-f"]
