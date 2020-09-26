#!/usr/bin/python
#Dalton Larsen
#Lab 5 - Database Loader
#CS 3030 - Scripting Languages

import sqlite3
import csv
import sys

if len(sys.argv) != 3:
	print ("Usage: dbload CSVFILE DATABASEFILE")
	exit (1)

#Open CSV File
try:
    inputCSVFile = str(sys.argv[1])

except:
	print("Input File Error")
	exit(1)

#Open Database
try:
	databaseFile = str(sys.argv[2])

except:
	print("Database Error")
	exit(1)

#Establish Connection and Cursor
conn = sqlite3.connect(databaseFile)
curs = conn.cursor()

#Create Classes Table
curs.execute('''drop table if exists classes''')
curs.execute('''create table classes
	(id text, subjcode text, coursenumber text, termcode text)''')

#Create Students table
curs.execute('''drop table if exists students''')
curs.execute('''create table students
	(id text primary key unique, lastname text, firstname text, major text, email text, city text, state text, zip text)''')

#establish reader
reader = csv.reader(open(inputCSVFile, 'r'), delimiter=',', quotechar='"')
counter = 0
for row in reader:
	counter += 1
	if counter == 1:
		continue

	course = row[5].split(" ")
	c = (row[0], course[0], course[1], row[6])
	
	curs.execute('''insert into classes (id, subjcode, coursenumber, termcode)
		values (?,?,?,?)''', c)
        if not curs.execute('''SELECT id FROM students WHERE id = "%s"''' % row[0]).fetchone():
            r = (row[0], row[2], row[1], row[4], row[3], row[7], row[8], row[9])
	    curs.execute('''insert into students (id, lastname, firstname, major, email, city, state, zip)
		values (?, ?, ?, ?, ?, ?, ?, ?)''', r)

conn.commit()
exit(0)
