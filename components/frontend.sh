#!/bin/bash

source components/common.sh

OS_PREREQ

Head "Installing Nginx and Npm"
sudo apt install nginx -y &>>$LOG
sudo apt install npm -y &>>$LOG

stat $?

Head "Downloading COMPONENT"
cd /var/www/html && git clone https://github.com/PradeepreddyKapa/frontend.git &>>$LOG && cd frontend

Head "Building the Code"
npm install &>>$LOG && npm run build &>>$LOG
stat $?

Head "Moving Conf file"
mv frontend.conf /etc/nginx/sites-enabled/default

Head "Exporting Ip's"
export AUTH_API_ADDRESS=http://172.31.23.200:8080
export TODOS_API_ADDRESS=http://172.31.30.210:8080
stat $?

Head "Starting Npm Service"
npm start 
#systemctl restart nginx &>>$LOG && systemctl start nginx &>>$LOG systemctl enable nginx &>>$LOG


