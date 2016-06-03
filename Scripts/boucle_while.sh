#!/bin/bash
#
#
i=1
while((i <= 10))
do 
	echo "i = $i"
	let i++ #i=i+1
done

echo "----------------------------"

i=1
while [ i -le 10 ]
do
	echo "i = $i"
	let i++
done

echo "****************************"
i=1
while test "$i" -le 10 #test est une commande linux, pas une instruction du shell, donc ne pas l'utiliser comme nom de fichier!!!!
do
	echo "i = $i"
	let i++
done
