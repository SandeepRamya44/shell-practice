#!/bin/baash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "script started executed at: $(date)"

if [ $USERID -ne 0 ]; then
    echo "Error: PLease run the script with root access" | tee -a $LOG_FILE
    exit 1 # failure is other than zero
fi

VALIDATE(){

        if [ $1 ne 0 ]; then
            echo -e "Installing $2....$R is failure $N" 
            exit 1
        else
            echo -e "Installing $2....$G is Success $N"
        fi
    
}

dnf list installed mysql &>>$LOG_FILE

if [ $? -ne 0 ]; then
    dnf install mysql -y &>>$LOG_FILE
    VALIDATE $? "MYSQL"
else 
    echo -e "MYSQL already exist....$Y SKIPPING $N" | tee -a $LOG_FILE
fi

dnf list installed nginx &>>$LOG_FILE

if [ $? -ne 0 ]; then
    dnf install nginx -y &>>$LOG_FILE
    VALIDATE $? "Nginx"
else
    echo -e " Nginx already exist .... $Y SKIPPING $N" | tee -a $LOG_FILE
fi

dnf list installed python3 &>>$LOG_FILE

if [ $? -ne 0 ]; then
    dnf install python3 -y &>>$LOG_FILE
    VALIDATE $? "python3"
else
    echo -e " Python already exist .... $Y SKIPPING $N" | tee -a $LOG_FILE
fi
