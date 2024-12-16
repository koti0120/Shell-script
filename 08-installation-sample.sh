#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
  echo "please run this script with root user"
  exit 1 #manually exit if error comes
else
  echo "this is super user"
fi

dnf install maven -y

if [ $? -ne 0 ]
then
  echo "installation of maven is...FAILURE"
exit 1
else
  echo "installation of maven is... SUCCESS"
fi 

dnf install git -y

if [ $? -ne 0 ]
then
  echo "installation of git is FAILURE"
  exit 1
else
  echo "installation of git is SUCCESS"
fi