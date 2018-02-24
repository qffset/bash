#!/bin/bash
# Made by qffset 30/11/17

wget --quiet -O - "http://192.168.0.33" | sed -e :a -e 's/^M$//g;/</N;//ba' | grep -v "^[[:space:],\t]*$" > /home/qffset/temp.log


#Переменные с датчиков
hum=`cat /home/qffset/temp.log | sed -n 14p`
dav=`cat /home/qffset/temp.log | sed -n 19p`
temp_in=`cat /home/qffset/temp.log | sed -n 24p | cut -c1-2`
temp_out=`cat /home/qffset/temp.log | sed -n 29p`


user="root"
pass="flogitfand"
db="temp"
sql="INSERT INTO temp (hum,dav,temp_in,temp_out) VALUES ("$hum","$dav","$temp_in","$temp_out")";
mysql -h localhost -u $user -p$pass $db -e "$sql"

