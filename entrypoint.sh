#!/bin/bash
cd /home/container

# Выводим текущую версию Node.js
node -v

# Подставляем переменные окружения в команду запуска
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Запускаем сервер
${MODIFIED_STARTUP}
