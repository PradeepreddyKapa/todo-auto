#!/bin/bash

source components/common.sh
OS_PREREQ


Head "Installing Npm"
sudo apt install npm -y &>>$LOG
stat $?

Head "Downloading COMPONENT"
git clone https://github.com/PradeepreddyKapa/todo.git &>>$LOG && cd todo 
mv systemd.service /etc/systemd/system/todo.service
sed -i -e "s/REDIS_ENDPOINT/redis.devpracon.tech/" /etc/systemd/system/todo.service
stat $?

Head "Buliding the code"
npm install &>>$LOG && npm run build &>>$LOG
stat $?

Head "Starting the service"
npm start 
