string1 = input("Enter a string: ")
string2 = input("Enter a string: ")
string3 = input("Enter a string: ")

if string1 < string2 and string2 < string3:
    print(string1 + "\n" + string2 + "\n" + string3)

elif string1 < string3 < string2:
    print(string1+ "\n"+ string3+ "\n"+ string2)

elif string2 < string1 < string3:
    print(string2+ "\n"+ string1+ "\n"+ string3)

elif string2 < string3 < string1:
    print(string2+ "\n"+ string3+ "\n"+ string1)

elif string3 < string1 < string2:
    print(string3+ "\n"+ string1+ "\n"+ string2)

elif string3 < string2 < string1:
    print(string3+ "\n"+ string2+ "\n"+ string1)

