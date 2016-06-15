#!/bin/bash
#
#
while true
do
	clear
	echo "1 - Liste des Usagers"
	echo "2 - Liste des processus"
	echo "3 - Liste des fichiers ordinaires"
	echo "Q|q - Quitter"
	read -n 1 -p "Saisissez une des options > " choix
	case "$choix" in 
		1) less /etc/passwd;;
		2) ps -e | less;;
		3) find -type f | less;;
		Q|q) break;;
		*) read -n 1 -p "Mauvais choix ; Appuyer sur une touche pour continuer";;
	esac
done
echo
