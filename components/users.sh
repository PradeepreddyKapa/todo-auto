#!/bin/bash

source components/common.sh

OS_PREREQ

Head "Installing Dependencies"
apt install openjdk-8-jdk -y &>>$LOG && apt install maven -y &>>$LOG
Stat $?

Head "Clone Repo"

cd /home/ubuntu
git clone https://github.com/PradeepreddyKapa/users.git &>>$LOG && mv Todo-users users && cd users
Stat $?

Head "Building Packages"
mvn clean package &>>$LOG 
Stat $?

Head "Creating Service"

mv systemd.service /etc/systemd/system/users.service && systemctl daemon-reload &>>$LOG && systemctl start users && systemctl enable users &>>$LOG
Stat $?