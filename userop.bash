#!/bin/bash
#set -x
########################################################################
#       Script:   userop.bash	
#
#       Purpose:  System admin working users
#
#       Usage:    use with opsys 
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

while [ $FLAG -ne 5 ]
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
    echo "       1 = Create a user "
    echo "       2 = Change the group for a user "
    echo "       3 = Create a group "
    echo "       4 = Delete a user "
    echo "       5  = Exit "
echo "-------------------------------------------------------------"
read -p " Choose an options: ==> " FLAG
  case $FLAG in
	1) clear
	   echo "------------------------------------------"
           echo "          Create a user"
           echo "------------------------------------------"
           read -p "User id to create ==> " UID
	   read -p "User new password ==> " PID
	   sudo useradd -m $UID -p PID 
	   sleep 5;;
	2) clear
           echo "------------------------------------------"
           echo "          Change the group for a user "
           echo "------------------------------------------"
	   read -p "New group name ==> " UGRP
 	   read -p "File to change ==> " FGRP
	   chgrp $UGRP $FGRP
	   ls -l $FGRP
           sleep 5;; 
	3) clear
           echo "------------------------------------------"
           echo "          Create a Group "
           echo "------------------------------------------"
	   read -p "New group name ==> " NGRP
	   read -p "User for new group ==> " UGRP
	   sudo usermod -a -G $NGRP $UGRP 
	   sleep 5;; 
	4) clear
           echo "------------------------------------------"
           echo "         Delete a user " 
           echo "------------------------------------------"
           read -p "User id to delete ==> " UID
	   sudo deluser $UID 
           sleep 5;;
	5) clear
           exit;;
  esac
done


##################
#                #
#        End     #
#                #
##################

exit $exitrc
