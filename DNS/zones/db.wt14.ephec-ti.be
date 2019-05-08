
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
        IN      TXT      "v=spf1 a mx ip4:51.77.203.64 include:_spf.google.com ~all"
;A Records
ns1     IN      A       51.77.203.64                    ; Cet enregistrement fait correspondre une adresse IP à un nom de machine.


;Configuration WEB

web             IN      A       51.77.203.64 ; VPS - MAXIME
web             IN      AAAA    2001:41d0:404:200::1332

www             IN      CNAME   web
b2b             IN      CNAME   web
intranet        IN      CNAME   web

;configuration MAIL

mail            IN      A       51.77.203.64
smtp            IN      CNAME   mail
pop3            IN      CNAME   mail
imap            IN      CNAME   mail
default._domainkey      IN      TXT     ( "v=DKIM1; k=rsa; "
          "p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtZsCvhpDGxc/27EoW/QAbFEkKSSNcT2FUHoN5mpLpQGCSnHSCMPJSDOS26dDIYJ4+QYLJ+YiH7N5w3LsgBxDFNphn4p0DFppYHjeW0wkd5fY4Z7dLdhTmplAmQ+lK65Xh+KJCVMYYAABae9v1uLK/M7PH5L9RbCXn7FsmVuamaSwYT+ECkcI4BvqzLVGQnt9R+W1PXBGZ715/l"
          "A8/8BBzxVMARDkDFHGJQ1eSsFMqI12ZMiQDuSOdOgnqNlRHyMjQhmzv1DdWWFnmXX1XLuAII9D+JAhlqahTX0dPiQd7tvqmgxQ0LDxriBoR/duk/hUibdXvzcty8IOWSdJtcyNJQIDAQAB" )  ; ----- DKIM key default for wt14.ephec-ti.be
_dmarc          IN      TXT     ( "v=DMARC1; p=none; pct=100; fo=1; rua=mailto:dmarck-reports@wt14.ephec-ti.be")
$INCLUDE /etc/bind/Kwt14.ephec-ti.be.+008+34099.key
$INCLUDE /etc/bind/Kwt14.ephec-ti.be.+008+59979.key
