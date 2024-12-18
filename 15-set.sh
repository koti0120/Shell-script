#!/bin/bash
set -e
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
  echo "please run this script with root user"
  exit 1 #manually exit if error comes
else
  echo "this is super user"
fi

dnf install mavennn -y
dnf install git -y