#!/bin/bash

DATE=$(date)

export IMAGE="hangopnh/python:latest"

var1=$(skopeo inspect docker://huypn/python:latest | jq '.Digest')
var1=${var1:1}
var1=${var1::-1}

var2=$(docker inspect --format='{{index .RepoDigests 0}}' $IMAGE)
var2=${var2:30}


if [[ "$var1" = "$var2" ]]
then
  echo "[$DATE] No need to create new container" >> /root/huypn/compare-python.log
else
  echo "[$DATE] Now creating new container" >> /root/huypn/compare-python.log
  ./deploy.sh
fi
