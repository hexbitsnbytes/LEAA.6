#!/usr/bin/env python
# -*- coding: utf-8 -*-
from ftplib import FTP
import os
# voir : man console_codes ( sous shell)

# CSI="\x1B["
# reset=CSI+"m"
# print CSI+"30;47m" + "Salut" + CSI + "0m"
# print CSI+"31;40m" + "Toi" + CSI + "0m"
class bcolors:
    CSI="\x1B["
    reset=CSI+"m"
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'
os.system("clear")
files = []
dico_files={}
host     = "localhost"                      # adresse du serveur FTP
user     = "ftp"                            # votre identifiant
password = "ftp"                            # votre mot de passe
ftp      = FTP(host,user,password)          # on se connecte au serveur ftp
# ftp.retrlines('LIST')                     # Equivalent à ls -l ( rep : pub )
files = ftp.nlst()
i=1
print "{0:5s} {1}".format("\n\nIndex","Fichier")
for fic in files:
    print "{0:5d} {1}".format(i, fic)
    dico_files[str(i)]=fic
    i +=1
print "\n\n"
while 1:
    rep=raw_input("Donnez l'index du fichier à télécharger ou 0 pour quitter : ")
    if rep == "0" : break
    if not dico_files.has_key(rep):
        print " Erreur de choix "
        continue
    fic=dico_files[rep]
    try:
        with open(os.path.join(".", fic), 'wb') as f:
            ftp.retrbinary('RETR ' + fic, f.write)
            print bcolors.OKBLUE,fic , " : télécharger correctement ",bcolors.reset
    except Exception,e : print e
ftp.quit()
print bcolors.WARNING+"\n\n\tFin Ftp"
print bcolors.reset
