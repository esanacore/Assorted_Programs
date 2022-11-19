tankSize = int(input("How many gallons of gas are in the tank? "))

mpg = int(input("What is the fuel economy in miles per gallon? "))

gasPrice = float(input("What is the cost of gas per gallon? "))

cost = 100 / mpg * gasPrice

maxDistance = tankSize * mpg

print("The cost per 100 miles is $%.2f" % cost)

print("The maximum distance that can be travelled on a full tank of gas is %.2f miles " % maxDistance)




