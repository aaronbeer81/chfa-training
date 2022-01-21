#!/bin/bash

set -e

export IMAGE_TAG=2.2.1
export IMAGE_TAG_CA=1.4.9

docker-compose -f docker-compose.yml kill && docker-compose -f docker-compose.yml down --volumes --remove-orphans

CONTAINER_IDS=$(docker ps -a | awk '($2 ~ /dev-peer.*/) {print $1}')
if [ -z "$CONTAINER_IDS" -o "$CONTAINER_IDS" == " " ]; then
    echo "No containers available for deletion."
else
    docker rm -f $CONTAINER_IDS
fi

DOCKER_IMAGE_IDS=$(docker images | awk '($1 ~ /dev-peer.*/) {print $3}')
if [ -z "$DOCKER_IMAGE_IDS" -o "$DOCKER_IMAGE_IDS" == " " ]; then
    echo "No images available for deletion."
else
    docker rmi -f $DOCKER_IMAGE_IDS
fi
