#!/bin/bash

IMAGE="python"
HOST_NAME=$(hostname -f)
var1="$(docker ps -aq -f name=python-final-container)"

echo "Log in"
docker login -u hangopnh -p $PASS
docker pull hangopnh/$IMAGE:latest

if [ -z "$var1" ]
then
	echo "Seem it hasn't started yet"
	echo "It's will be started right now"
	docker run --name python-final-container -p 5000:5000 -e APP_VERSION="latest" -e APP_HOST=$HOST_NAME -d hangopnh/$IMAGE:latest
	echo "It started now"
else
	echo "it's running, need remove then re-deploy"
	docker stop python-final-container
    docker rm python-final-container
    docker run --name python-final-container -p 5000:5000 -e APP_VERSION="latest" -e APP_HOST=$HOST_NAME -d hangopnh/$IMAGE:latest
	echo "the deployment is done"
fi
