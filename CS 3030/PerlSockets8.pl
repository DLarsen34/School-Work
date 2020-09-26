#!/usr/bin/perl
#Dalton Larsen
#Lab 8 - Sockets
#CS 3030 - Scripting Lanugauges

use IO::Socket;

if(@ARGV != 2)
{
	print STDERR "Usage: ./socket.pl HOSTNAME SOCKETNUMBER\n";
}

$remote = IO::Socket::INET->new(
	Proto => "tcp",
	PeerAddr => $ARGV[0],
	PeerPort => "socket($ARGV[1])",)
	or die print STDERR "Error: Can't connect to ssh port";
$line = <$remote>;
print $line;
exit(0);