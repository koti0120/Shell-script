#!/bin/bash
SOURCE_DIRECTORY=/tmp/app-logs
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

FILES=$(find $SOURCE_DIRECTORY -name "*.log" -mtime +14)

# echo "files to delete: $FILES"

while IFS= read -r line #IFS=Internal Field Separator
do
  echo "deleting file: $line"
done<<<$FILES  #<<< means input and >>> means output