#!/usr/bin/env python
# -*- coding: utf-8 -*-
from ftplib import FTP
host     = "10.17.0.79"                     # adresse du serveur FTP
user     = "ftp"                            # votre identifiant
password = "ftp"                            # votre mot de passe
ftp      = FTP(host,user,password)          # on se connecte au serveur ftp
#
# Contenu du répertoire /var/ftp/pub ( du serveur FTP )
#
ftp.cwd("pub")
ftp.retrlines('LIST')                       # Equivalent à ls -l ( rep : pub )

