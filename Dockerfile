FROM ghcr.io/requarks/wiki:2

# Переключаемся на root
USER root

# Устанавливаем зависимости (если нужно) и создаем пользователя container
RUN adduser --disabled-password --home /home/container container

# Возвращаемся к пользователю container
USER container
ENV USER=container HOME=/home/container

WORKDIR /home/container

# Копируем entrypoint.sh
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Запускаем сервер
CMD ["/bin/bash", "/entrypoint.sh"]
