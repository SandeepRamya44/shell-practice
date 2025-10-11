#!/bin/baash
USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Error: PLease run the script with root access"
    exit 1 # failure is other than zero
fi

dnf install mysql -y

if [ $? ne 0 ]; then
    echo "Error: Installing MYSQL is failure"
    exit 1
else
    echo "Installing MYSQL is Success"
fi