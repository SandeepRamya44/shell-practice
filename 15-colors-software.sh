#!/bin/baash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


if [ $USERID -ne 0 ]; then
    echo "Error: PLease run the script with root access"
    exit 1 # failure is other than zero
fi

VALIDATE(){

        if [ $1 ne 0 ]; then
            echo -e "Installing $2....$R is failure $N"
            exit 1
        else
            echo "Installing $2....$G is Success $N"
        fi
    
}

dnf list installed mysql

if [ $? -ne 0 ]; then
    dnf install mysql -y
    VALIDATE $? "MYSQL"
else 
    echo -e "MYSQL already exist....$Y SKIPPING $N"
fi

dnf list installed nginx

if [ $? -ne 0 ]; then
    dnf install nginx -y
    VALIDATE $? "Nginx"
else
    echo -e " Nginx already exist .... $Y SKIPPING $N"
fi

dnf list installed nginx

if [ $? -ne 0 ]; then
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo -e " Python already exist .... $Y SKIPPING $N"
fi


