def main():
    inputFile = open("Baby Names.txt","r")
    boyNames = open("BoyNames.txt","w")
    girlNames = open("GirlNames.txt","w")
    #listOfLines = inputFile.readlines()
    for line in inputFile:
    #for line in listOfLines:
        parts = line.split()
        if len(parts) >= 3:
            rank, boy, girl = parts
            boyNames.write(rank + "\t" + boy + "\n")
            girlNames.write(rank + "\t" + girl + "\n")
            
    inputFile.close()
    boyNames.close()
    girlNames.close()

main()    
    
