#!/bin/bash
#
#CE SCRIPT N'EST PAS FONCTIONNEL
# Script qui lit une valeur numérique à l'entrée standard
#Verifier si la valeur lue est numerique (expression reguliere)
# Vérification si la valeur est supérieure à 100

read -p "Nombre = " nombre
if [[ "$nombre" =~ ^[0-9]+$ ]]
then
#if [ "$nombre" -ge 100 ]
#if test $nombre -gt 100
	if(($nombre > 100))
	then 
		echo "$nombre > 100"
	else
		if [ $nombre -eq 100 ]
		then
			echo "$nombre = 100"
		else 
			echo "$nombre < 100"
		fi
	fi	
else
	echo "nonnumerical value"
fi

