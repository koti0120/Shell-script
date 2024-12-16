#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S) #here F=format, H=Hour, M=minutes
SCRIPT_NAME=$($0 | cut -d "." -f1) #here we remove file name after . we used delimeter and cut command
LOG_FILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

validate(){
    if [ $1 -ne 0 ]
    then
      echo "$2 is FAILURE"
      exit 1
    else
      echo "$2 is SUCCESS"
    fi
} 

if [ $USERID -ne 0 ]
then
  echo "Please run the script with root user"
  exit 1
else
  echo "you are super user"
fi

dnf install mysql -y &>>$LOG_FILE # here &=means both outputs either succes or failure

validate $? "installing mysql"

dnf install git -y &>>$LOG_FILE

validate $? "installing git"