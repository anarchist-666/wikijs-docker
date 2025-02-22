FROM ghcr.io/requarks/wiki:2

# Переключаемся на root
USER root

# Создаём пользователя container
RUN adduser --disabled-password --home /home/container container

WORKDIR /home/container

# Копируем entrypoint.sh и меняем права под root
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Переключаемся обратно на пользователя container
USER container
ENV USER=container HOME=/home/container

# Запускаем сервер
CMD ["/bin/bash", "/entrypoint.sh"]
