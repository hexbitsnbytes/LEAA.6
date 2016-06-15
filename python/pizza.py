# 
#	TITLE : pizza menu
#
#	
import os


toppings = [ 'pepperoni', 'peppers', 'extra cheese', 'garlic', ' olives']

# Checks if an element of the list match a hard coded string

for topping in toppings:
	if topping == "peppers":
		print("You want peppers")
		check = 0

# Clearing the screen

if check == 0:
	os.system("clear")

# Getting user input

print("Format: topping 1, topping2")
user_toppings = input("What topping would you like?")

# Checking the user's answer BUT ITS NOT WORKING!!!
raw_input("You chose " + user_toppings + ". Is that right? [Y|N]")
if input.lower() == "y":
	print("Thanks, your order will be coming soon")
if input.lower() == "n":
	print("Please, enter your order again")
