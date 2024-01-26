#!/usr/bin/env perl

=pod

=head1 Using the script for create hosts for Check Point dbedit
#===============================================================================
#
#       FILE: create_host_plain.pl 
#
#       USAGE: $ touch ./in.txt
#		10.5.5.5	
#		10.7.7.7
#		10.8.8.8
#		10.9.9.9
#		etc
#
#		$ ./create_host_plain_1.0.1.pl in.txt
#
#		$ cat ./host_plain.txt
#		create host_plain Organization_User_Computer_10.5.5.5
#		modify network_objects Organization_User_Computer_10.5.5.5 ipaddr 10.5.5.5
#		modify network_objects Organization_User_Computer_10.5.5.5 color 'forest green'
#		create host_plain Organization_User_Computer_10.7.7.7
#		modify network_objects Organization_User_Computer_10.7.7.7 ipaddr 10.7.7.7
#		modify network_objects Organization_User_Computer_10.7.7.7 color 'forest green'
#		create host_plain Organization_User_Computer_10.8.8.8
#		modify network_objects Organization_User_Computer_10.8.8.8 ipaddr 10.8.8.8
#		modify network_objects Organization_User_Computer_10.8.8.8 color 'forest green'
#		create host_plain Organization_User_Computer_10.9.9.9
#		modify network_objects Organization_User_Computer_10.9.9.9 ipaddr 10.9.9.9
#		modify network_objects Organization_User_Computer_10.9.9.9 color 'forest green'
#
#  DESCRIPTION: Create hosts for Check Point dbedit
#
#      OPTIONS: ---
# REQUIREMENTS: Perl v5.14+ 
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Vladislav Sapunov 
# ORGANIZATION:
#      VERSION: 1.0.1
#      CREATED: 04.10.2023 22:48:36
#     REVISION: ---
#===============================================================================
=cut

use strict;
use warnings;
use v5.14;
use utf8;

# Result outFile for dbedit
my $outFile = 'host_plain.txt';

my $fqdn                 = "Organization_User_Computer_";
my $createHostPlain      = "create host_plain ";
my $modifyNetworkObjects = "modify network_objects ";
my $ipaddr               = "ipaddr ";
my $color                = "color \'forest green\'";

# Open result outFile for writing
open( FHW, '>', $outFile ) or die "Couldn't Open file $outFile" . "$!\n";

#Reading source inFile from <>
while ( defined( my $ip = <> ) ) {
    chomp($ip);
    say FHW "$createHostPlain" . "$fqdn" . "$ip";
    say FHW "$modifyNetworkObjects" . "$fqdn" . "$ip" . " " . "$ipaddr" . "$ip";
    say FHW "$modifyNetworkObjects" . "$fqdn" . "$ip" . " " . "$color";
}

# Close the filehandle
close(FHW) or die "$!\n";

say "**********************************************************************************\n";
say "Host plain TXT file: $outFile created successfully!";

my $cpUsage = <<__USAGE__;

***************************************************************************************
* # Create the actual object (of type host_plain)
* create host_plain Organization_User_Computers_10.1.1.1
*
* # Modify the host IP address
* modify network_objects Organization_User_Computer_10.1.1.1 ipaddr 10.1.1.1
*
* # Add a comment to describe what the object is for (optional)
* modify network_objects Organization_User_Computer_10.1.1.1 color 'forest green'
* 
* # Color [aquamarine 1, black, blue, blue 1, burly wood 4, cyan, dark green, dark khaki,
* dark orchid, dark orange 3, dark sea green 3, deep pink, deep sky blue 1, dodger blue 3,
* firebrick, foreground, forest green, gold, gold 3, gray 83, * gray 90, green, lemon chiffon,
* light coral, light sea green, light sky blue 4, magenta, medium orchid, medium slate blue,
* medium violet red, navy blue, olive drab, orange, red, sienna, yellow, none]			
*
* #dbedit
* update_all
* savedb					
***************************************************************************************

__USAGE__

say $cpUsage;


