#!/bin/bash

cd nodejs/
echo "An image Nodejs is building ..."
docker build -t nodejs:latest .
echo "Building is done"

