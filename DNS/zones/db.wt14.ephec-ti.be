;
;BIND File
;

$TTL 1d
$ORIGIN wt14.ephec-ti.be.
@       1D      IN      SOA     ns1.wt14.ephec-ti.be. root.wt14.ephec-ti.be. (
                                1       ; serial
                                3H      ; refresh
                                15      ; retry
                                1w      ; expire
                                3h)     ;

;NS RECORDS
        IN      NS              ns1.wt14.ephec-ti.be.           ;Utilisé pour définir quels serveurs répondent pour cette zone.
        IN      MX      10      mail.wt14.ephec-ti.be.

;A Records
ns1     IN      A       51.77.203.64                    ; Cet enregistrement fait correspondre une adresse IP à un nom de machine.


;Configuration WEB

web             IN      A       51.77.203.64 ; VPS - MAXIME


www             IN      CNAME   web
b2b             IN      CNAME   web
intranet        IN      CNAME   web

;configuration MAIL

mail            IN      A       51.77.203.64
smtp            IN      CNAME   mail
pop3            IN      CNAME   mail
imap            IN      CNAME   mail
$INCLUDE /etc/bind/Kwt14.ephec-ti.be.+008+07087.key
$INCLUDE /etc/bind/Kwt14.ephec-ti.be.+008+45228.key
