#!/bin/sh
sudo docker ps --filter "status=running" | awk '{print $1}' | xargs --no-run-if-empty sudo docker stop

sudo docker ps --filter "status=exited" | awk '{print $1}' | xargs --no-run-if-empty sudo docker start

sudo docker ps --filter "status=exited" | awk '{print $1}' | xargs --no-run-if-empty sudo docker rm

sudo docker run -d \
    --name mysql-mamute \
    -e MYSQL_ROOT_PASSWORD=secretpassword \
    -e MYSQL_DATABASE=mamute \
    -e MYSQL_USER=mamute \
    -e MYSQL_PASSWORD=mamute \
    mysql:5.7.4

sudo docker run -d \
    --name mamute \
    --link mysql-mamute:mysql \
    -e MAMUTE_PORT=8080 \
    -p 8080:8080 \
    jayden/testapp .
