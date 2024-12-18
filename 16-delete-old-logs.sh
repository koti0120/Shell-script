#!/bin/bash
SOURCE_DIRECTORY=/tmp/app-logss
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ -d $SOURCE_DIRECTORY ] #here -d means this test for directory
then
   echo -e "$G source directory already exists $N"
else
   echo -e "$R Please make sure $SOURCE_DIRECTORY exist $N"
   exit 1
fi

# FILE=$(find $SOURCE_DIRECTORY -name "*.log" -mtime +14)

# while 
# do
#   rm -rf 
# done<<<$FILE