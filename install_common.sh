#!/bin/bash

## install common 


HOSTNAME=$(hostname)
IP=$(hostname -I | awk '{print $2}')
echo "START - install common - "$IP

echo "Add host name for ip"
host_exist=$(cat /etc/hosts | grep -i "$IP" | wc -l)
if [ "$host_exist" == "0" ];then
echo "$IP $HOSTNAME " >/etc/hosts
fi


echo "END - install common - " $IP

