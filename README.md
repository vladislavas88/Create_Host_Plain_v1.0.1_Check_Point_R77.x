Using the script for create hosts for Check Point dbedit
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
