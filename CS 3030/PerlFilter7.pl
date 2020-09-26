#!/usr/bin/perl
#Dalton Larsen
#Lab 7 - Perl Filter
#CS 3030 - Scripting

if(@ARGV != 2)
{
	print STDERR "Usage: ./filter.pl 'FROMSRTING' 'TOSTRING'\n";
	exit(1);
}

while(<STDIN>)
{
	eval "s/$ARGV[0]/$ARGV[1]/g";
	print;
}
exit(0);