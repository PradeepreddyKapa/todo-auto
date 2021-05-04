#!/bin/bash

source components/common.sh
OS_PREREQ

Head "Installing Java and Maven"
apt install openjdk-8-jdk -y &>>$LOG
apt install maven -y &>>$LOG
stat $?


Head "Downloading the component"
git clone https://github.com/PradeepreddyKapa/users.git &>>$LOG && cd users && mv systemd.service /etc/systemd/system/users.service  
stat $?

Head "Building the Code"
mvn clean Package &>>$LOG
stat $?

Head "Starting the Service"
sudo java -jar target/users-api-0.0.1.jar
