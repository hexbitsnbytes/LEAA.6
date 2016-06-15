#!/bin/bash
#
# Script qui évalue des chaines de caractère
#
read -p "Type a string -->" string

# 1- Vérifier sui la chaine est égale à usager
if [ -z "$string" ] 
then
	echo "Vous devez entrer une valeur! Essayez à nouveau"
else
	if [ "$string" = "usager" ]
	then
		echo "vous avez tapé $string ... boring"
	else
		echo "Original de penser à taper $string"
		echo "Bonne journée"
	fi
fi 
