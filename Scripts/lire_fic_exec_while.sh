#!/bin/bash
#
#Script qui utilise exec pour lire un fichier
# Paramètres : [nom_du_fichier]
#	si pas de paramètre. c'est le fichier /etc/passwd qui sera affiché
#
fic=${1:-/etc/passwd}
if [ -f "$fic" ]
then
	exec < "$fic"	 
	while read ligne
	do
		echo $ligne
	done
else
	echo "$fic n'est pas un fichier ordinaire"
fi
