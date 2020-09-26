#!/usr/bin/python
#Dalton Larsen
#Lab 6 - Filemaker
#CS 3030 - Scripting Languages

#import libraries
import sys
import random
import shlex

#check for correct parameters
if len(sys.argv) != 4:
    print('Usage: ./filemaker INPUTCOMMANDFILE OUTPUTFILE RECORDCOUNT')
    exit(1)

#store parameters in variables
iFile = sys.argv[1]
oFile = sys.argv[2]
rCount = sys.argv[3]

#check that variables are correct
try:
    recordCount = int(rCount)
except:
    print("Error with record count")
    exit(1)

try:
    inputFile = open(iFile, 'r')
except:
    print("Error with input file")
    exit(1)

try:
    outputFile = open(oFile, 'w')
except:
    print("Error with output file")
    exit(1)

commands = inputFile.readlines()
randomFiles = {}

if commands[0] == "HEADER":
    outputFile.write(commands[1].decode('string_escape'))
   
for i in range(len(commands)):
    command = shlex.split(commands[i])
    if command[0] == "FILEWORD":
        inFile = open(command[2], 'r')
        randomFiles[command[2]] = inFile.readlines()
inFile.close()

randomData = {}

for i in range(recordCount):
    randomData = {}
    for c in range(len(commands)):
        command = shlex.split(commands[c])
        if command[0] == "STRING":
            outputFile.write(command[1].decode('string_escape'))
        if command[0] == "FILEWORD":
            label = command[1]
            if label in randomData:
                print "Error - key exists"
                exit(1)
            else:
                randomWord = randomFiles[command[2]][random.randint(0, len(randomFiles[command[2]])-1)]
                randomWord = randomWord.rstrip()
                randomData[command[1]] = randomWord
                outputFile.write(randomData[command[1]])
        if command[0] == "NUMBER":
            label = command[1]
            minNum = int(command[2])
            maxNum = int(command[3])
            if label in randomData:
                print "Error - Key Exists"
                exit(1)
            else:
                randomNumber = random.randint(minNum, maxNum)
                randomData[command[1]] = str(randomNumber)
                outputFile.write(randomData[command[1]])
        if command[0] == "REFER":
            label = command[1]
            outputFile.write(randomData[label])

exit(0)