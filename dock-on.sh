#!/bin/sh
REPOSITORY_NAME="badhoven"
CONTAINER_NAME="home-assistant"
LOCAL_DIRECTORY=/opt/home-assistant

docker build -t ${REPOSITORY_NAME}/rpi3-home-assistant:latest .
docker stop ${CONTAINER_NAME}
docker rm ${CONTAINER_NAME}
docker run -d --name ${CONTAINER_NAME} --net=host -v /etc/localtime:/etc/localtime:ro -v ${LOCAL_VOLUME}:/config ${REPOSITORY_NAME}/rpi3-home-assistant:latest
