#!/bin/bash

DATE=$(date)
 
export IMAGE="hangopnh/nodejs:latest"

var1=$(skopeo inspect docker://huypn/nodejs:latest | jq '.Digest')
var1=${var1:1}
var1=${var1::-1}

var2=$(docker inspect --format='{{index .RepoDigests 0}}' $IMAGE)
var2=${var2:30}


if [[ "$var1" = "$var2" ]]
then
  echo "[$DATE] No need to create new container" >> /root/huypn/compare-nodejs.log
else
  echo "[$DATE] Now creating new container" >> /root/huypn/compare-nodejs.log
  ./deploy.sh
fi
