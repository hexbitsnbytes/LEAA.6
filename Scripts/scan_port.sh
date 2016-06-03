#!/bin/bash
#
# Script qui lit un fichier qui contient les ports à surveiller
#
IFS=$'\n'
for port in $(cat scan_port.conf)
do
	if lsof -i:$port >/dev/null 2>&1
	then
		echo "$port : ouvert"
	else
		echo "$port : non ouvert"
	fi	
done
