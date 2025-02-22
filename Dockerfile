FROM ghcr.io/requarks/wiki:2

# Переключаемся на root
USER root

# Создаём пользователя container (если его нет)
RUN adduser --disabled-password --home /home/container container

# Устанавливаем рабочую директорию
WORKDIR /home/container

# Удаляем остатки предыдущих данных (если есть) и создаем нужные папки
RUN rm -rf /home/container/* && mkdir -p /home/container

# Копируем ВЕСЬ проект в /home/container
COPY --chown=container:container . /home/container/

# Даем права на выполнение entrypoint.sh
RUN chmod +x /home/container/entrypoint.sh

# Переключаемся обратно на пользователя container
USER container
ENV USER=container HOME=/home/container

# Запускаем сервер
CMD ["/bin/bash", "/home/container/entrypoint.sh"]
