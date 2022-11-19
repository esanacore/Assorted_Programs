listA = list(range(1,10))

def swapFirstAndLast(listA):
    first = [0]
    last = [-1]
    listA.remove(first)
    listA.insert(last)
    return listA
print("A: ",swapFirstAndLast(listA))
    

def shiftToTheRight(listA):
    listA.insert(0,listA.pop())
    return listA
print("Original list: ", listA)
print("B: ",shiftToTheRight(listA))

def replaceEvensWithZero(listA):
    index = 0
    for number in listA:
##        print(number)
        if int(number) % 2 == 0:
            listA.remove(number)
            listA.insert(index,0)
        index += 1
    return listA

print("C: ",replaceEvensWithZero(listA))
