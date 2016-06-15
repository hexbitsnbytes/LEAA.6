import sys
import time
import os

title_head="""
 =============================
|  Welcome stranger           |
|  This is a strange land     |
|  zombies and shit           |
 =============================
"""
choice1 = """
a) run
b) scream
c) mimic a rock
d) this game is no fun, let me leave
"""

choice2 = """
From the attack, you suffered. But you're still standing. Well done. 

The werewolf left 3 items, 
	- a gem
	- a chicken bone
	- a rabbit claw
do you pick any? (Y|N)
If so, which one?
"""

hp = 20
print(title_head)
print(choice1)
print "A werewolf comes out of nowhere... What do you do:"
user_choice = raw_input("make a choice:")
user_control = raw_input("")

if user_choice.lower() == str("a"):
	print("You're not fast enough m8, YOU DIE")
elif user_choice == str("b").lower():
	print("Aaaaaaaaaaaaaaaaaaaaaah")
elif user_choice.lower() == "c":
	print("bad decision... They saw your act. You loose one hp")
	hp = 19
	print (HP) 
elif user_choice.lower() == str("d") or str("exit"):
	exit
