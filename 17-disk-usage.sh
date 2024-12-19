#!/bin/bash
DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=6
MESSAGE=""

while IFS= read -r line #IFS=Internal Field Separator
do
  USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)
  FOLDER=$(echo $line | awk -F " " '{print $NF}')
  if [ $USAGE -ge $DISK_THRESHOLD ]
  then 
    MESSAGE+="$FOLDER is more than $DISK_THRESHOLD, current usage is: $USAGE \n" #\n is for new line and + is used for append
  fi
done<<<$DISK_USAGE

echo -e "Message: $MESSAGE"