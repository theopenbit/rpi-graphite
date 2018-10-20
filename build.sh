#!/bin/bash
mkdir build
cd build
git clone -b v1.1.4-4 https://github.com/graphite-project/docker-graphite-statsd.git
cd docker-graphite-statsd
sed -i '1s/.*/FROM resin\/rpi-raspbian:jessie/' Dockerfile
DOCKER_TAG='latest'
if [ -n "$TRAVIS_TAG" ]; then DOCKER_TAG=$TRAVIS_TAG; fi
docker build -t theopenbit/rpi-graphite:$DOCKER_TAG .
docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"
docker push theopenbit/rpi-graphite:$DOCKER_TAG
