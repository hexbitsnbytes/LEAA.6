#!/usr/bin/python
import mesfonctions
try:
    x=int(raw_input("Nombre: "))
    print 1/x
except BaseException,e: #ValueError
    mesfonctions.clear()
    print "\n"
    print "Erreur: %s" %(e)
    print "\n"
