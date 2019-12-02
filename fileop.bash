#!/bin/bash
#set -x
########################################################################
#       Script:   fileop.bash
#
#       Purpose:  File operations
#
#       Usage:    use with opsys.bash 
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

while [ $FLAG -ne 11 ]
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
    echo "       1 = Create a file "
    echo "       2 = Delete a file "
    echo "       3 = Create a directory "
    echo "       4 = Delete a directory "
    echo "       5 = Create a symbolic link "
    echo "       6 = Change ownership of a file "
    echo "       7 = Change permissions on a file "
    echo "       8 = Modify text within a file "
    echo "       9 = Compress a file "
    echo "       10 = Decompress a file "
    echo "       11 = Exit "
echo "-------------------------------------------------------------"
read -p " Choose an options: ==> " FLAG
  case $FLAG in
	1) clear
	   echo "------------------------------------------"
           echo "          Create a file"
           echo "------------------------------------------"
           read -p "File to create ==> " NFILE
	   touch $NFILE
           ls -l $NFILE
	   sleep 5;;
	2) clear
           echo "------------------------------------------"
           echo "          Delete a file"
           echo "------------------------------------------"
	   read -p "File to create ==> " NFILE
           rm -f $NFILE
           ls -l $NFILE
           sleep 5;; 
	3) clear
           echo "------------------------------------------"
           echo "          Create a directory"
           echo "------------------------------------------"
	   read -p "File to create ==> " NDIR
           mkdir $NDIR
           ls -ltr $NDIR
           sleep 5;; 
	4) clear
           echo "------------------------------------------"
           echo "          Delete a Directory"
           echo "------------------------------------------"
           read -p "File to create ==> " NDIR
           rmdir -r $NDIR
           ls -ltr $NDIR
           sleep 5;;
	5) clear
           echo "------------------------------------------"
           echo "          Create a symbolic link"
           echo "------------------------------------------"
           read -p "File to link ==> " LFILE
           read -p "Link ==> " LINKF
	   ln -s $LFILE $LINKF
 	   ls -l $LFILE
           sleep 5;;
	6) clear
           echo "------------------------------------------"
           echo "          Change owership of a file"
           echo "------------------------------------------"
           read -p "Owner of file ==> " CHOW
	   read -p "File to change ==> " CFILE 
           chown $CHOW $CFILE
           ls -ltr $CFILE
	   sleep 5;;
	7) clear
           echo "------------------------------------------"
           echo "          Change permissions on a file"
           echo "------------------------------------------"
           read -p "Permissions to change on file ==> " CHOW 
           read -p "File to change ==> " CFILE
           chmod $CHOW $CFILE
	   ls -l $CFILE
	   sleep 5;;
	8) clear
           echo "------------------------------------------"
           echo "          Modify text within a file"
           echo "------------------------------------------"
	   read -p "File to change ==> " CFILE
           vi $CFILE;;
	9) clear
           echo "------------------------------------------"
           echo "         Compress a file" 
           echo "------------------------------------------"
	   read -p "Compress File Name ==> " CFILE
	   read -p "Name of compress file ==> " CFILE2
  	   tar -czvf $CFILE.tar.gz $CFILE2
	   rm -f $CFILE2
           ls -l $CFILE.tar.gz
           sleep 5;;
	10) clear 
           echo "------------------------------------------"
           echo "         Decompress a file"
           echo "------------------------------------------"
           read -p "File to decompress ==> " CFILE
	   tar -xvzf $CFILE.tar.gz
           rm -f $CFILE.tar.gz
           ls -lrt 
	   sleep 5;;
	11) echo "Exit";;
  esac
done


##################
#                #
#        End     #
#                #
##################

exit $exitrc
