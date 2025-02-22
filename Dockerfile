FROM ghcr.io/requarks/wiki:2

# Переключаемся на root
USER root

# Создаём пользователя container, если его нет
RUN adduser --disabled-password --home /home/container container

# Устанавливаем рабочую директорию
WORKDIR /home/container

# Копируем весь проект в /home/container
COPY --chown=container:container . /home/container/

# Убеждаемся, что entrypoint.sh исполняемый
RUN chmod +x /home/container/entrypoint.sh

# Переключаемся обратно на пользователя container
USER container
ENV USER=container HOME=/home/container

# Запускаем сервер
CMD ["/bin/bash", "/home/container/entrypoint.sh"]
