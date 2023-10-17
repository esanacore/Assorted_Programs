footballs = int(input("Please enter the desired quantity of footballs to be purchased: "))

if (footballs < 6):
    thirtyDollarFootballs = footballs * 30
    print("Each football is $30 - with a total cost of $%.2f"  %thirtyDollarFootballs)

elif (6 <= footballs < 12):
    twentyEightDollarFootballs = footballs * 28
    print("Each football will be $28 - with a total cost of $%.2f" %twentyEightDollarFootballs)

else:
    twentySixDollarFootballs = footballs * 26
    print("Each football will be $26 - for a total of $%.2f " %twentySixDollarFootballs)
