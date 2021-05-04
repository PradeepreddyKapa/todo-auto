#!/bin/bash

source components/common.sh
OS_PREREQ

Head "Installing Java and Maven"
apt install openjdk-8-jdk -y &>>$LOG && apt install maven -y &>>$LOG
stat $?


Head "Downloading the component"
git clone https://github.com/PradeepreddyKapa/users.git &>>$LOG && cd users && mv systemd.service /etc/systemd/system/users.service  
stat $?

Head "Building the Code"
cd /root/todo-auto/users
mvn clean &>>$LOG && mvn clean package &>>$LOG
stat $?

Head "Starting the Service"
systemctl daemon-reload &>>$LOG && systemctl start users && systemctl enable users &>>$LOG
