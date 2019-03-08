#!/usr/bin/env bash


set -e -x


# Delete existing default machine
docker-machine rm --force default


# Create a new docker machine
docker-machine create \
  --driver virtualbox \
  --virtualbox-memory "4096" \
  --virtualbox-disk-size "25000" \
  --virtualbox-cpu-count "2" \
  --virtualbox-boot2docker-url \
  https://github.com/boot2docker/boot2docker/releases/download/v17.07.0-ce/boot2docker.iso default
