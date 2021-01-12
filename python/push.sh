#!/bin/bash

IMAGE="python"

echo "Log in"
docker login -u hangopnh -p $PASS

echo "Tag the image"
docker tag $IMAGE:latest hangopnh/$IMAGE:latest
echo "Tag is done"

echo "Push the image to dockerhub: hangopnh/python:latest"
docker push hangopnh/$IMAGE:latest
