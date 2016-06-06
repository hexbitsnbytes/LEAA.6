#
#	title : Interface
#	
import os
import time
os.system('clear')

print('#### ULTRA SECRET BOOT CAMP - NIS | ABC | NDSFLT | XEX | ####')
time.sleep(1)
print('Welcome to our organization, Agent 24')
time.sleep(1)
print('For our reccords, please answer truthfully to the following questions')
time.sleep(1)
person = raw_input('Enter your name: ')
weapon = raw_input('What is your favourite weapon: ')
age = raw_input('How old are you: ')

user = { "name":person, "weapon of choice":weapon, "age":age }

os.system('clear')
print("Do you confirm all of these informations?")
print("Please note that if you fail to comply, you could be prosecuted")
for key, value in user.items(): 
	print(key + " : " + value)

