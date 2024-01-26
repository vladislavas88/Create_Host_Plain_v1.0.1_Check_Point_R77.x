#!/usr/bin/env perl

=pod

=head1 Using the script for create hosts for Check Point dbedit
#===============================================================================
#
#         FILE: create_host_plain_xlsx.pl 
#
#        USAGE: $ sudo dnf install perl-App-cpanminus
#        		$ cpanm Spreadsheet::ParseExcel Spreadsheet::XLSX Spreadsheet::Read
#
#               $./create_host_plain_xlsx.pl
#
#  DESCRIPTION: Create hosts for Check Point dbedit
#
#      OPTIONS: ---
# REQUIREMENTS: Perl v5.14+ 
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Vladislav Sapunov 
# ORGANIZATION:
#      VERSION: 1.0
#      CREATED: 05.10.2023 22:22:08
#     REVISION: ---
#===============================================================================
=cut

use strict;
use warnings;
use v5.14;
use utf8;
use Spreadsheet::Read;

#use Data::Dumper; # for debug

# Source XLSX File with IP adresses
my $workbook = ReadData('IN.xlsx') or die "Couldn't Open file " . "$!\n";
my $sheet    = $workbook->[1];
my @ipList   = $sheet->{cell}[1];

#my @rows=Spreadsheet::Read::rows($workbook->[1]);
#my @column = $sheet->{cell}[1];
#print Dumper \@rows;
#print Dumper \@column;
# Result outFile for dbedit
my $outFile = 'host_plain_from_xlsx.txt';

#my @ipList=("10.10.10.1","10.20.20.2","10.30.30.3","10.40.40.4");
my $fqdn                 = "Organization_User_Computer_";
my $createHostPlain      = "create host_plain ";
my $modifyNetworkObjects = "modify network_objects ";
my $ipaddr               = "ipaddr ";
my $color                = "color \'forest green\'";

# Open result outFile for writing
open( FHW, '>', $outFile ) or die "Couldn't Open file $outFile" . "$!\n";

foreach my $i (@ipList) {
    foreach my $ip (@$i) {
        #say "$fqdn"."$ip";
        chomp($ip);
        say FHW "$createHostPlain" . "$fqdn" . "$ip";
        say FHW "$modifyNetworkObjects" . "$fqdn" . "$ip" . " " . "$ipaddr" . "$ip";
        say FHW "$modifyNetworkObjects" . "$fqdn" . "$ip" . " " . "$color";
    }
}

# Close the filehandle
close(FHW) or die "$!\n";

say "**********************************************************************************\n";
say "Host plain TXT file: $outFile created successfully!";

my $cpUsage = <<__USAGE__;

***************************************************************************************
* # Create the actual object (of type host_plain)
* create host_plain Organization_User_Computers_10.10.10.1
*
* # Modify the host IP address
* modify network_objects Organization_User_Computer_10.10.10.1 ipaddr 10.10.10.1
*
* # Add a comment to describe what the object is for (optional)
* modify network_objects Organization_User_Computer_10.10.10.1 color 'forest green'
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


