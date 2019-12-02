#!/bin/bash
#set -x
########################################################################
#       Script:   processop.bash
#
#       Purpose:  System admin processing operations
#
#       Usage:     works with opsys.bash
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
ARCDATE=`date +%m%d%H%M`                  #Initate arcival date
FLAG=0

##################
#                #
#  Main Program  #
#                #
##################

while [ $FLAG -ne 4 ]
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
    echo "       1 = Show all processes "
    echo "       2 = Kill a process "
    echo "       3 = Bring up top"
    echo "       4 = Return to main menu "
echo "-------------------------------------------------------------"
read -p " Choose an options: ==> " FLAG
  case $FLAG in
	1) clear
	   echo "------------------------------------------"
           echo "          Show all processes"
           echo "------------------------------------------"
	   ps -ef | more
           sleep 5;;
	2) clear
           echo "------------------------------------------"
           echo "          Kill a process"
           echo "------------------------------------------"
	   echo "Enter PID you would like to kill ==> "
                read $?
                kill -9 $?
           sleep 5;; 
	3) clear
           echo "------------------------------------------"
           echo "          Bring up top"
           echo "------------------------------------------"
	   top;;
  esac
done


##################
#                #
#        End     #
#                #
##################

exit $exitrc
