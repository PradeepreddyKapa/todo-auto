#!/bin/bash

source components/common.sh
OS_PREREQ


Head "Installing Npm"
sudo apt install npm -y &>>$LOG
stat $?

Head "Downloading COMPONENT"
cd /root/
git clone https://github.com/PradeepreddyKapa/todo.git &>>$LOG && cd todo 

Head "Move Systemd file"
mv systemd.service /etc/systemd/system/todo.service

Head "change DNS in service file"
sed -i -e "s/REDIS_ENDPOINT/redis.devpracon.tech/" /etc/systemd/system/todo.service
stat $?

Head "Buliding the code"
npm install &>>$LOG && npm run build &>>$LOG
stat $?

Head "Starting the service"
#npm start 
systemctl daemon-reload &>>$LOG && systemctl start todo && systemctl enable todo &>>$LOG
systemctl status todo
