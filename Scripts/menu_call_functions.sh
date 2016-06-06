#!/bin/bash
#
# Script qui propose un menu, avec utilisation de focntions internes
#
liste_users(){ less /etc/passwd;}
liste_ps(){ ps -e | less;}
liste_fic(){ find -type f | less;}
while true
do
	clear
	echo "1 - Liste des Usagers"
	echo "2 - Liste des processus"
	echo "3 - Liste des fichiers ordinaires"
	echo "Q|q - Quitter"
	read -n 1 -p "Saisissez une des options > " choix
	case "$choix" in 
		1) liste_user;;
		2) liste_ps;;
		3) liste_fic;;
		Q|q) break;;
		*) read -n 1 -p "Mauvais choix ; Appuyer sur une touche pour continuer";;
	esac
done
echo
