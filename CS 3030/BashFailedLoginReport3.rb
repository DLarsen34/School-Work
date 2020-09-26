  
#!/bin/bash
#Dalton Larsen
#Lab 3 Failed Login Report
#CS 3030 - Scripting Language

if [ -z "$1" ]
then
	echo "Usage: srpt PATH "
exit 1
fi

grep 'Failed password for ' $@ > firstOut
sed -n 's/.*Failed password for \([a-z0-9A-Z_]*\) .*/\1/p' firstOut >secondOut
sort <secondOut  >thirdOut
uniq -c <thirdOut  >fourthOut
sort -k1,1nr -k2,2 fourthOut >fifthOut
sed 's/invalid/\&lt;UNKNOWN\&gt;/' <fifthOut >sixthOut

printf "<html>\n<body><h1>Failed Login Attempts Report as of $(date)</h1>\n"
cat sixthOut| while read mycount myuserid; do
	printf "<br /> %'d %s\n" "$mycount" "$myuserid"
done
printf "</body> </html>"

exit