#!/usr/bin/python
#Dalton Larsen
#Lab 4 - Temp
#CS 3030 - Scripting Languages

#function to go from fahrenheit to celsius
def fahrenheitToCelsius(fahrenheit):
    C = (fahrenheit - 32.0) * (5.0/9.0)
    return C

#function to go from celsius to fahrenheit
def celsiusToFahrenheit(celsius):
    F = (9.0/5.0) * celsius + 32.0
    return F

#print hello message
print("Welcome to the CS 3030 Temperature Conversion Program")

#while loop to print out thee main menu until the user exits
while True:
    print("\nMain Menu\n1:Fahrenheit to Celsius\n2:Celsius to Fahrenheit\n3:Exit program\n")
    x = raw_input("Please enter 1, 2, or 3:")
    try:
        a = int(x)
    except:
        print("Invalid entry")
        continue

    if a == 1:
        oneInput = raw_input("Please enter degrees Fahrenheit: ")
        try:
            fToC = float(oneInput)
            print("%.1f degrees Fahrenheit eqauls %.1f degrees Celsius" % (fToC,fahrenheitToCelsius(fToC)))
        except:
            print("Invalid entry")
            continue

    if a == 2:
        twoInput = raw_input("Please enter degrees Celsius: ")
        try:
            cToF = float(twoInput)
            print("%.1f degrees Celsius eqauls %.1f degrees Fahrenheit" % (cToF,celsiusToFahrenheit(cToF)))
        except:
            print("Invalid entry")
            continue

    if a == 3:
        exit(0)