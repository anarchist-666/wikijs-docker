# Используем готовый образ Wiki.js
FROM ghcr.io/requarks/wiki:2

MAINTAINER Pterodactyl Software, <support@pterodactyl.io>

# Создаём пользователя container (обязательно для Pterodactyl)
RUN adduser --disabled-password --home /home/container container

USER container
ENV USER=container HOME=/home/container

WORKDIR /home/container

# Копируем entrypoint.sh
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Запускаем сервер
CMD ["/bin/bash", "/entrypoint.sh"]
