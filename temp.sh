#!/bin/bash
# Made by qffset 30/11/17



wget --quiet -O - "http://192.168.0.33" | sed -e :a -e 's/^M$//g;/</N;//ba' | grep -v "^[[:space:],\t]*$" > /home/qffset/temp.log


#Переменные с датчиков
hum=`cat /home/qffset/temp.log | sed -n 14p`
dav=`cat /home/qffset/temp.log | sed -n 19p`
temp_in=`cat /home/qffset/temp.log | sed -n 24p | cut -c1-2`
temp_out=`cat /home/qffset/temp.log | sed -n 29p`

num=`cat /var/www/html/num.log`

switch=`cat /home/qffset/switch.log`
on="1"
off="0"



#Подключение к MySQL
user="root" 
pass="flogitfand"
db="temp"
sql="INSERT INTO temp (hum,dav,temp_in,temp_out) VALUES ("$hum","$dav","$temp_in","$temp_out")";
#mysql -h localhost -u $user -p$pass $db -e "$sql" 2>/dev/null



#Переменные Telegram
chat_id="367897431"
                text_msg="Отопление включено. Сейчас - $temp_in. Порог - $num."
                text_msg2="Отопление выключено. Сейчас - $temp_in. Порог - $num."
                url="https://api.telegram.org/bot327431230:AAGv59FiMwOCXTW0FDvfFxqJNU866n67xVA/sendMessage"

#Работаем
if [[ "$temp_in"  =~ "^[0-9]+$" ]]; then
        $temp_in = "0"
fi



if [[ "$temp_in" -ge "$num" ]]; then
        if [[ "$switch" = "$off" ]]; then


echo "0" > /home/qffset/switch.log

else

 echo "0" > /home/qffset/switch.log | curl http://192.168.0.33/?Level=0 > /dev/null

fi

else

 if [[ "$switch" = "$on" ]]; then


echo "1" > /home/qffset/switch.log

else

 echo "1" > /home/qffset/switch.log | curl http://192.168.0.33/?Level=1 > /dev/null

fi

fi

