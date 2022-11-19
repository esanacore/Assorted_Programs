def countWords (string1):

##    string1 = input("Enter a string, this function will count instances of a word in the string")

    spaces = 0

    for character in string1:
        if character == " ":
            spaces = spaces + 1

    qty_of_words = spaces + 1

    print("The string entered was: " , string1, sep = " ")
    print("The number of words in that sentence is: ", qty_of_words, sep = " ")

countWords('This is a sentence.')
