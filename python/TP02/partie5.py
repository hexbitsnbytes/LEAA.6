#=====================================================
# V - Utilisation d'un browser pour afficher le résultat
#=====================================================

# But :  Utilisation du langage python pour produire une page web (html) ,
#        résultat de l'interrogation de la base de données
#
# Code Python
#
#!/usr/bin/python
# -*- coding=utf-8 -*- 
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
try: 
	print "connexion..." 
	# connexion 
	connexion=db.connect(host=host,user=user,passwd=pwd,db=nom_base) 
	# suivi 
	print "Connexion a MySQL reussie sous l'identite host={0},user={1},passwd={2},db={3}".format(host,user,pwd,nom_base) 
except db.OperationalError,message: 
	print "Erreur : {0}".format(message)
	sys.exit()

fic=open("page.html","w")
fic.write('<html><head><title>Python et Mysql</title></head>')
fic.write('<body><h2>Liste des utilisateurs</h2>')
entete = ["User Name","Uid","Gid","Rep_Connexion","Programme"]
table_data = [  entete ]
sql="SELECT * FROM users"
cursor = connexion.cursor()
try:
   cursor.execute(sql)
   results = cursor.fetchall()
   for row in results:
        table_data.append([row[0],row[2],row[3],row[5],row[6]])
except:
   print "Erreur : aucune donnée disponible"

# disconnect from server
connexion.close()
htmlcode = HTML.table(table_data)
fic.write(htmlcode)
fic.write('</body></html>')
fic.close()
os.system("opera page.html")

# Travail a faire : Commentez ce script

