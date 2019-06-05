FROM ubuntu

#installation de Samba
RUN apt-get update \ 
	&& apt-get -y install samba \
	&& apt-get -y install samba-common-bin \
	&& apt-get -y install nano

#On cree les groupes, les repertoires qui sont lies aux groupes et on donne les droits pour chaque repertoire

RUN groupadd directeur \
&&	groupadd comptable \
&&	groupadd commerce \
&&	groupadd secretaire \
&&	groupadd employe \

# on associe chaque utilisateur a son departement

&&	useradd -m -g directeur directeur \
&&  useradd -m -g comptable comptable1 \
&&  useradd -m -g comptable comptable2 \
&&  useradd -m -g employe employe \
&&  useradd -m -g commerce commerce1 \
&&  useradd -m -g commerce commerce2 \
&&  useradd -m -g secretaire secretaire \

# cree les dossiers
&&	mkdir /home/commun \ 
&&	mkdir /home/Directeur \
&&	mkdir /home/Comptable \
&&	mkdir /home/Commerce \
&&	mkdir /home/Secretaire \

#permissions ,  rendre le dossier Commun accessible à tout le monde
&&	chmod 777 /home/commun \

#donne tous les droits sur le répertoire Directeur au propriétaire (c'est à dire root) et au groupe propriétaire
&&	chown -R root:directeur /home/Directeur \
&&	chown -R 770 /home/Directeur \

&&  chown -R root:secretaire /home/Secretaire \
&&  chown -R 770 /home/Secretaire \

&&  chown -R root:comptable /home/Comptable \
&&  chown -R 770 /home/Comptable \

&&  chown -R root:commerce /home/Commerce \
&&  chown -R 770 /home/Commerce \

#supprimer le fichier smb.conf par defaut
&&	rm /etc/samba/smb.conf 

#On copie le nouveau fichier smb.conf dans le container
COPY ./smb.conf /etc/samba/	 

#On expose les ports necessaires
EXPOSE 445 139

#services samba 
CMD service smbd start && service nmbd start  
