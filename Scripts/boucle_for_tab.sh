#!/bin/bash
#
# Script permettant de gérer des tableaux. Le tableau peut contenir toute information à laquelle on a acces element par element
#
for((i=0;i<=9;i++))
do
	read -p "indice [$i+1] = " n1
	tab[$i]=$n1
done
for((i=0;i<=9;i++))
do
	echo " ${tab[$i]} "
done
