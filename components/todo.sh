#!/bin/bash

source components/common.sh
OS_PREREQ


Head "Installing Npm"
sudo apt install npm -y &>>$LOG
stat $?

Head "Downloading COMPONENT"
git clone https://github.com/PradeepreddyKapa/todo.git &>>$LOG
cd todo
stat $?