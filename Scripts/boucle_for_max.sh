#!/bin/bash
#
# Script permettant de gérer des tableaux. Le tableau peut contenir toute information à laquelle on a acces element par element
#
for((i=0;i<=9;i++))
do
	read -p "indice $[i+1] = " n1
	tab[$i]=$n1
done

#cherche le max
max=0
for((i=0;i<=9;i++))
do
	if(( ${tab[$i]} > $max))
	then
		max=${tab[$i]}
	fi
done
echo "max = $max"
