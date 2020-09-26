#!/bin/bash
#Dalton Larsen
#Lab 2 - Search and Report
#CS 3030 - Scripting Languages

mkdir /tmp/dl63860

if [ $# -ne 1 ]
then
	echo "Usage: srpt path"
exit 1
fi

find $1 \( -type d  -fprintf /tmp/dl63860/dcnt "\n" \) , \( -type f -fprintf /tmp/dl63860/fcnt "\n" \) , \( -type l -fprintf /tmp/dl63860/scnt "\n" \) , \( -type f -mtime +365 -fprintf /tmp/dl63860/ocnt "\n" \) , \( -type f -size +500000c -fprintf /tmp/dl63860/lcnt "\n" \) , \( -type f -iname *.bmp -fprintf /tmp/dl63860/bmpcnt "\n" \) , \( -type f -iname *.jpg -fprintf /tmp/dl63860/jpgcnt "\n" \) , \( -type f -iname *.gif -fprintf /tmp/dl63860/gifcnt "\n" \) , \( -type f -name "*.o" -fprintf /tmp/dl63860/tmpcnt "\n" \) , \( -type f -executable -fprintf /tmp/dl63860/ecnt "\n" \) , \( -type f -size +0 -fprintf /tmp/dl63860/fsize "%s\n" \)


numDirect=$( wc -l /tmp/dl63860/dcnt | cut -d" " -f1 )
numDirect=$numDirect
let "numDirect -= 1"
numFiles=$( wc -l /tmp/dl63860/fcnt | cut -d" " -f1 )
numSymLinks=$( wc -l /tmp/dl63860/scnt | cut -d" " -f1 )
numOldFiles=$( wc -l /tmp/dl63860/ocnt | cut -d" " -f1 )
numBigFiles=$( wc -l /tmp/dl63860/lcnt | cut -d" " -f1 )
numBmp=$( wc -l /tmp/dl63860/bmpcnt | cut -d" " -f1 )
numJpg=$( wc -l /tmp/dl63860/jpgcnt | cut -d" " -f1 )
numGif=$( wc -l /tmp/dl63860/gifcnt | cut -d" " -f1 )
let "numPics = numBmp + numJpg + numGif"
numTmp=$( wc -l /tmp/dl63860/tmpcnt | cut -d" " -f1 )
numeEx=$( wc -l /tmp/dl63860/ecnt | cut -d" " -f1 )
totalSize=$( awk '{tot+=$1}END{print tot}' /tmp/dl63860/fsize )

printf "SearchReport $HOSTNAME $@ $(date)"
printf "\nExectution time %'d\n" $SECONDS
printf "Directories %'d\n" $numDirect
printf "Files %'d\n" $numFiles
printf "Sym links %'d\n" $numSymLinks
printf "Old files %'d\n" $numOldFiles
printf "Large files %'d\n" $numBigFiles
printf "Graphics files %'d\n" $numPics
printf "Temporary files %'d\n" $numTmp
printf "Executable files %'d\n" $numeEx
printf "TotalFileSize %'d\n" $totalSize

rm -r /tmp/dl63860
exit