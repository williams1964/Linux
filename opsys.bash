#!/bin/bash
#set -x
########################################################################
#       Script:   opsys.bash
#
#       Purpose:  Sysadmin script to work files, processes and users
#
#       Usage:    Script Shell 
#
#       Notes:    
#
#       Revision History
#       Date            Author          Remarks
#       ----            ------          -------
#       12/1/2019      Roger Williams   Original version 1.0.
#
#
#######################################################################

##################
#                #
#     Global     #
#                #
##################

exitrc=0                                  #Initate exit return code
FLAG=0

##################
#                #
#  Main Program  #
#                #
##################

while [ $FLAG -ne 12 ]
do
clear
echo " "
echo "          ======================================"
echo "                       Main Menu"
echo "          ======================================"
echo " "
date
echo " "
echo "-------------------------------------------------------------"
echo "Choice:"
    echo "       1 = Operating system info "
    echo "       2 = Hostname and dns info"
    echo "       3 = Network info"
    echo "       4 = Who is online "
    echo "       5 = Last logged in users "
    echo "       6 = Free and used memory "
    echo "       7 = Get my ip address "
    echo "       8 = My Disk Usage "
    echo "       9 = Process Usage"
    echo "       10 = Users Operation "
    echo "       11 = File Operation "
    echo "       12 = Exit "
echo "-------------------------------------------------------------"
read -p " Choose an options: ==> " FLAG
  case $FLAG in
	1) clear
	   echo "------------------------------------------"
           echo "          Operating system info"
           echo "------------------------------------------"
	   uname -r
	   uname -a
	   cat /proc/version
           sleep 5;;
	2) clear
           echo "------------------------------------------"
           echo "          Hostname and dns info"
           echo "------------------------------------------"
	   hostname -a
	   grep --color nameserver /etc/resolv.conf
           sleep 5;; 
	3) clear
           echo "------------------------------------------"
           echo "          Network info"
           echo "------------------------------------------"
	   nmcli connection show
           nmcli device status
	   ip r	
	   sleep 5;; 
	4) clear
           echo "------------------------------------------"
           echo "          Who is online"
           echo "------------------------------------------"
            who
           sleep 5;;
	5) clear
           echo "------------------------------------------"
           echo "          Last logged in users"
           echo "------------------------------------------"
           last
           sleep 5;;
	6) clear
           echo "------------------------------------------"
           echo "          Free and used memory info"
           echo "------------------------------------------"
           free -m
           free -t	
           vmstat
           vmstat 2 5
           vmstat -a
           sleep 5;;
	7) clear
           echo "------------------------------------------"
           echo "          IP Address"
           echo "------------------------------------------"
	   ip route get 1.2.3.4 |awk '{print $7}'
           sleep 5;;
	8) clear
           echo "------------------------------------------"
           echo "          Disk Usage"
           echo "------------------------------------------"
	   df 
           df -h
           sleep 5;;
	9) clear
           echo "------------------------------------------"
           echo "         Process Usage" 
           echo "------------------------------------------"
	   $HOME/scripts/processop.bash;;
	10) clear
           echo "------------------------------------------"
           echo "         Users Operations"
           echo "------------------------------------------"
           $HOME/scripts/userop.bash;;
	11) clear
           echo "------------------------------------------"
           echo "         Files Operations"
           echo "------------------------------------------"
           $HOME/scripts/fileop.bash;;
  esac
done


##################
#                #
#        End     #
#                #
##################

exit $exitrc
