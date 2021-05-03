#!/bin/bash

COMPONENT=$1


export LOG=/tmp/${COMPONENT}.log
rm -f $LOG

USER_NAME=$(whoami)

if [ "${USER_NAME}" != "root" ]; then
  ERROR "You should be a root user to perform this script, Try with sudo"
  exit 1
fi
