#!/bin/bash
#
#
# 1- Script affiche le nom du script
# 2- Script à un paramètre passé en mode commande
# 3- Script qui vérifie si ce paramètre est un fichier qui existe et affiche un fichier ordinaire

echo "Nom du Script: $0" # $0 qui contient le nom du ficheir
#
# Vérifier s'il y a un paramètre
if [ $# -ne 1 ]
then
	echo "Usage : $0 nom_fichier [paramètre]"
	exit 1 # ceci est le code retour --> erreur de syntaxe car != de prametre
fi

if [ -f "$1" ]
then
	file "$1"
	less "$1"
else
	echo "$1 n'est pas un chemin valide"
	exit 2 # fichier n'existe pas
fi
	

