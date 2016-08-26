#!/usr/bin/python
# -*- coding=utf-8 -*- 
# ======================================================================================================
# IV - Script python pour lister le contenu de la table "users" de la base de données "utilisateurs"
# ======================================================================================================

# Ecrire un script python qui va lister la table "users" de la base de données "utilisateurs"

# Travail à réaliser :
        
#            Prevoire les erreurs dans la requete SQL ,
#            Rajouter và la requete SQL une selection ( clause where )
#
#            Prevoire le cas ou le resultat est nul
import sys 
import os
import HTML
# import du module MySQLdb 
import MySQLdb as db
# connexion à une base MySql 
user="" 
pwd="" 
host="localhost" 
connexion=None 
nom_base="utilisateurs"

connexion=db.connect(host=host,user=user,passwd=pwd,db=nom_base)
sql_query=connexion.query("""SELECT * FROM users""")
results=connexion.store_result()
maxrows=1000
how=0
print results.fetch_row(maxrows, how)
