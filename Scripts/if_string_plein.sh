#!/bin/bash
#
# Script qui évalue des chaines de caractère
#
read -p "Type a string -->" string

# 1- Vérifier sui la chaine est égale à usager
if [ -n "$string" ] 
then
	echo "Voici ce que vous avez tapé: "$string" "

else
	if [ -z "$string" ]
	then
		echo "Un peu d'effort!"
	fi
fi 
