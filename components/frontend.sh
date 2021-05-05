#!/bin/bash

source components/common.sh

OS_PREREQ

Head "Installing Nginx and Npm"
sudo apt install nginx -y &>>$LOG
sudo apt install npm -y &>>$LOG

stat $?

Head "Downloading COMPONENT"
cd /var/www/html && git clone https://github.com/PradeepreddyKapa/frontend.git &>>$LOG && cd frontend
stat $?

Head "Building the Code"
npm install &>>$LOG && npm run build &>>$LOG
stat $?

Head "Moving Conf file"
mv frontend.conf /etc/nginx/sites-enabled/default


Head "Starting Npm Service"
npm start 

