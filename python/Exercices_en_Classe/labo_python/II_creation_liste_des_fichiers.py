#!/usr/bin/env python
# -*- coding: utf-8 -*-
from ftplib import FTP
host     = "10.17.0.79"                      # adresse du serveur FTP
user     = "ftp"                            # votre identifiant
password = "ftp"                            # votre mot de passe
ftp      = FTP(host,user,password)          # on se connecte au serveur ftp
#
# Création d'une liste ( files ) des fichiers du répertoire /var/ftp/pub ( du serveur FTP ) ( liste au sens python )
#
ftp.cwd("pub")
files = ftp.nlst()   # attention files avec s ( car file est un mot reservé )

print type(files),"\n"
print files,"\n"
for fichier in files:
    print fichier
