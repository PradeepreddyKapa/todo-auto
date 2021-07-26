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
sed -i -e "s/LOGIN_ENDPOINT/login.devpracon.tech/" -e "s/TODO_ENDPOINT/todo.devpracon.tech/" /etc/nginx/sites-enabled/default
stat $?

Head "Starting Npm Service"
npm start
#sudo systemctl restart nginx &>>$LOG && sudo systemctl start nginx &>>$LOG sudo systemctl enable nginx &>>$LOG
#sudo systemctl status nginx






