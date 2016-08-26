liste = [0,1]
for i in range(1,11):
    liste.append(liste[-2] + liste[-1])
print liste
