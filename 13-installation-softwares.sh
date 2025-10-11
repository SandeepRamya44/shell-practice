#!/bin/baash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Error: PLease run the script with root access"
    exit 1 # failure is other than zero
fi

VALIDATE(){

        if [ $1 ne 0 ]; then
            echo "Error: Installing $2 is failure"
            exit 1
        else
            echo "Installing $2 is Success"
        fi
    
}

dnf install mysql -y
VALIDATE $? "MYSQL"

dnf install nginx -y
VALIDATE $? "Nginx"

dnf install mongodb-mongosh -y
VALIDATE $? "mongosh"