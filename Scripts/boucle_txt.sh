#!/bin/bash
#
# Script qui lit un fichier texte avec la structure for.
#
IFS=$'\n'
for ligne in $(cat texte.txt)
do
	echo "$ligne"
done
