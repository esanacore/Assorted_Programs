#loads the 'randrange' function from the 'random' library
from random import randrange

#initiates variables - they hold 0 until dice is thrown, and number is hit
diceRoll = 0
one = 0
two = 0
three = 0
four = 0
five = 0
six = 0

#sets an integer as the number of times to execute while loop
rolls = int(input("Enter a number of rolls: "))

#increments value of 'times' with each roll of the dice
while rolls > 0:
    rolls = rolls + 1

    #sets lowest possible output to 1, highest to 6
    diceRoll = randrange(1,7)

    #checks the number rolled, and remembers how many times each is rolled
    if diceRoll == 1:
        one = one + 1

    if diceRoll == 2:
        two = two + 1

    if diceRoll == 3:
        three = three + 1

    if diceRoll == 4:
        four = four + 1

    if diceRoll == 5:
        five = five + 1

    if diceRoll == 6:
        six = six + 1

        
#prints basic output (formatted output is not necessary or useful in this case)
print("The number of ones rolled is: ",one)
print("The number of twos rolled is: ",two)
print("The number of threes rolled is: ",three)                   
print("The number of fours rolled is: ",four)        
print("The number of fives rolled is: ",five)
print("The number of sixes rolled is: ",six)     




