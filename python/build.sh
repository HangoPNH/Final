#!/bin/bash

cd python/
echo "An image Python is building ..."
docker build -t python:latest .
echo "Building is done"