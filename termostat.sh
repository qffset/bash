#!/bin/bash
# Made by qffset 30/11/17



wget --quiet -O - "http://192.168.0.33" | sed -e :a -e 's/^M$//g;/</N;//ba' | grep -v "^[[:space:],\t]*$" > /home/qffset/temp.log


#Переменные с датчиков
temp_in=`cat /home/qffset/temp.log | sed -n 24p | cut -c1-2`

num=`cat /var/www/html/num.log`

switch=`cat /home/qffset/switch.log`
on="1"
off="0"

#Переменные Telegram
chat_id="367897431"
                text_msg="Отопление включено. Сейчас - $temp_in. Порог - $num."
                text_msg_0="Отопление выключено. Сейчас - $temp_in. Порог - $num."
                url="https://api.telegram.org/bot327431230:AAGv59FiMwOCXTW0FDvfFxqJNU866n67xVA/sendMessage"

#Работаем
if [[ "$temp_in"  =~ "^[0-9]+$" ]]; then
	$temp_in = "0"
fi



if [[ "$temp_in" -ge "$num" ]]; then
	if [[ "$switch" = "$off" ]]; then


echo "0" > /home/qffset/switch.log  

else 

 echo "0" > /home/qffset/switch.log | curl -s -X POST $url -d chat_id="$chat_id" -d text="$text_msg_0"

fi

else

 if [[ "$switch" = "$on" ]]; then


echo "1" > /home/qffset/switch.log

else

 echo "1" > /home/qffset/switch.log | curl -s -X POST $url -d chat_id="$chat_id" -d text="$text_msg_0"

fi

fi
