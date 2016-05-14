# Version: 0.0.1
FROM ubuntu:14.04
MAINTAINER Yuri Trukhin <trukhinyuri@infoboxcloud.com>
RUN apt-get update
RUN apt-get install -y nginx
RUN echo 'Hi, I am in your container' \
        >/usr/share/nginx/html/index.html
EXPOSE 80



and 
docker build -t trukhinyuri/nginx ~/static_web
 trukhinyuri – название репозитория, где будет храниться образ, nginx – имя образа

docker build -t trukhinyuri/nginx \ git@github.com:trukhinyuri/docker-static_web
git repo for DOckerFIle



По-умолчанию Docker кеширует каждый шаг и формируя кеш сборок. Чтобы отключить кеш, например для использования последнего apt-get update, используйте флаг --no-cache.
docker build --no-cache -t trukhinyuri/nginx


Инструкция VOLUME добавляет тома в образ. Том — папка в одном или более контейнерах или папка хоста, проброшенная через Union File System (UFS).
VOLUME ["/opt/project"]

