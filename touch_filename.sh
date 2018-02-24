#!/bin/bash



DIR=/media/ed0efe0f-97ef-469a-9006-d5aac27487c8/Public/Временная/папка_автоматически_очищается_в_субботу_вечером

if [ ! -f "$DIR" ]; then
    # Создать папку, только если ее не было
    touch $DIR
curl --header 'Content-Type: application/json' --request 'POST' --data '{"chat_id":"367897431","text":"Информационный файл создан"}' "https://api.telegram.org/bot327431230:AAGv59FiMwOCXTW0FDvfFxqJNU866n67xVA/sendMessage"


fi




