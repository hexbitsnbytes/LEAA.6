#!/usr/bin/python

newfile = "newfile.txt"
fic_out = open(newfile,"a")
fic_out.write("ligne 1!\n")
fic_out.close
for i in open(newfile):
	print i,
