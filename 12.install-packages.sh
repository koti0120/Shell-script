#!/bin/bash
USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE=/etc/$SCRIPT_NAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
VALIDATE(){
    if [ $1 -ne 0 ]
    then
      echo -e "$2 is $R FAILURE $N" #Here e is enabling the colours
      exit 1
    else
      echo -e "$2 is $G SUCCESS $N"
    fi
}
if [ $USERID -ne 0 ]
then
  echo "please run this script with root user"
  exit 1
else
  echo "Now you are super user"
fi

for i in $@
do
   echo "package to install $i"
   dnf list installed $i &>>LOG_FILE
   if [ $? -eq 0] 
   then
     echo -e "$i is already installed ...$Y SKIPPING $N"
   else
     dnf install $i -y &>>LOG_FILE
     VALIDATE $? "installation of $i"
   fi
done
# echo "all packages: $@"
# dnf install mysql -y &>>$LOG_FILE
# VALIDATE $? "installing mysql"

# dnf install docker -y &>>$LOG_FILE
# VALIDATE $? "installing Docker"