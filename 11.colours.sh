#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S) #here F=format, H=Hour, M=minutes
SCRIPT_NAME=$(echo $0 | cut -d "." -f1) #here we remove file name after . we used delimeter and cut command
LOG_FILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
R="e\[31m" #Red colour
G="e\[32m" #grenn colour
N="e\[0m" #No colour

VALIDATE(){
    if [ $1 -ne 0 ]
    then
      echo -e "$2 is $R FAILURE $N"
      exit 1
    else
      echo -e "$2 is $G SUCCESS $N"
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

VALIDATE $? "installing mysql"

dnf install git -y &>>$LOG_FILE

VALIDATE $? "installing git"