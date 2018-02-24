#!/bin/bash
# Made by qffset 30/11/17

day=`date +"%Y%m%d"`
chas=`date +"%H"`
min=`date +"%M"`
path="/home/$day/$chas/"

find -name '*$day_$chas$min*' -print0 | xargs -0 ls -1rS > snap.log

#jpg=`find -type f -newer /home/$day/$chas/Red.jpg`



		chat_id="367897431"
		File="/home/$day/$chas/$jpg"
		url="https://api.telegram.org/bot327431230:AAGv59FiMwOCXTW0FDvfFxqJNU866n67xVA/sendPhoto"


curl -s -X POST $url -F chat_id="$chat_id" -F photo="@$File"






