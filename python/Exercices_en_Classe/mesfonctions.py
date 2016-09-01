#!/usr/bin/python
# -*- coding=utf-8 -*-
#
# Calcul de la taxe

def tvq(mnt):
    taxe=0.075
    return (mnt*taxe)

def tps(mnt):
    taxe_tps=0.05
    return (mnt*taxe_tps)

def fact(x):
    if x == 0 or x == 1:
        return 1
    return x *fact(x-1)

def clear():
    import os
    os.system("clear")

def get_num():
    import sys
    import re
    chaine = ""
    motif = "^[0-9]+$"
    while re.search(motif, chaine) is None:
        sys.stdout.write("Donnez un nombre valide: ")
        chaine = sys.stdin.readline()
    return chaine

def pause():
    raw_input("Appuyez sur une touche pour continuer...")

def pause2():
    import os
    a=os.system("read -n 1 -p 'Appuyez sur une touche'...")

def webget_python(link):
	import urllib2
	u=urllib2.urlopen(link)
	pdb_lines=u.readlines()
	u.close()
	for line in pdb_lines:
	    print line,
