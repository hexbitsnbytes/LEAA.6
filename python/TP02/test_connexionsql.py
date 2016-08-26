#!/usr/bin/python
# -*- coding=utf-8 -*- 
# =================================================
# II - Test de connexion avec la base "test" de mysql
# =================================================
# a) Message d'erreur lors de l'exécution:
# ----------------------------------------------------------------------------------
# File "test_connexionsql.py", line 11
# SyntaxError: Non-ASCII character '\xc3' in file test_connexionsql.py on line 11,
# but no encoding declared; see http://www.python.org/peps/pep-0263.html for details 
# ----------------------------------------------------------------------------------
# b) Problème d'indentation: Tabulations remplacées par 4 espaces
# ----------------------------------------------------------------------------------
# c) Après installation des "packages" manquant, le script affiche une connexion réussie
#    Succès pour la base de données utilisateurs
# ----------------------------------------------------------------------------------
import sys 
# import du module MySQLdb 
import MySQLdb 
# connexion à une base MySql 
# l'identité de l'utilisateur est (vide,vide) 
user="" 
pwd="" 
host="localhost" 
connexion=None 
nom_base="utilisateurs"      #  "test" à changer eventuellemet pour "utilisateurs"
try: 
    print "connexion..." 
    # connexion 
    connexion=MySQLdb.connect(host=host,user=user,passwd=pwd,db=nom_base) 
    print "Connexion a MySQL reussie sous l'identite host={0},user={1},passwd={2}".format(host,user,pwd) 

except MySQLdb.OperationalError,message: 
    print "Erreur : {0}".format(message) 
    sys.exit()

connexion.close() 


