#!/usr/bin/env python
# -*- coding: utf-8 -*-
from ftplib import FTP
import os
os.system("clear")
host     = "10.17.0.79"                      # adresse du serveur FTP
user     = "ftp"                            # votre identifiant
password = "ftp"                            # votre mot de passe
ftp      = FTP(host,user,password)          # on se connecte au serveur ftp
#
# Création d'une liste ( files ) des fichiers du répertoire /var/ftp/pub ( du serveur FTP ) ( liste au sens python )
#
ftp.cwd("pub")
files = ftp.nlst()   # attention files avec s ( car file est un mot reservé )
#
# Travail à faire
#
# a) Affichez le contenu de ce dictionnaire comme suit 
#
#    1 Cours_Python.zip
#    2 Red_Hat_Enterprise_Linux-6-Deployment_Guide-en-US.pdf
#    3 hist01.txt
#    4 initiation_python.pdf

dico = {}

for i in range(0,len(files)-1):
    dico[i]=files[i]

print dico,"\n"

l1 = dico.keys()
#l1.sort()
for i in l1:
    val = dico[i] 
    print "%s : %s" % (i,val)

#
# b) Choisir le rang (cle) du fichier à télécharger
#    Faire les controles nécéssaires ( existence de cle )
# c) Télecharger le fichier en question ; utilisation de la methode ftp.retrbinary()
while  1:
    fic=raw_input("Entrez le numéro du fichier à télécharger (ou q pour quitter): ")
    if fic == "q":
        break
    if dico.has_key(int(fic)):   
        fichier=dico[int(fic)]
        ftp.retrbinary("RETR "+ fichier, open(fichier, 'wb').write)
        print "Succes: " + fichier + " telecharge "
        
    else:
        print dico[int(fic)]
        print "Mauvais choix"
#    


# d) Faire une bouche (while) sur le choix tant que c'est different de 0 (zero)    
#
# Exemple
#
# Index Fichier
#    1 Cours_Python.zip
#    2 Red_Hat_Enterprise_Linux-6-Deployment_Guide-en-US.pdf
#    3 hist01.txt
#    4 initiation_python.pdf



#Donnez l'index du fichier à télécharger ou 0 pour quitter : 1
# Cours_Python.zip  : télécharger correctement  
#Donnez l'index du fichier à télécharger ou 0 pour quitter : 0


#	Fin Ftp
# c) Télecharger le fichier en question ; utilisation de la methode ftp.retrbinary()
ftp.close()


