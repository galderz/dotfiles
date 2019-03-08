#!/usr/bin/env bash


export DOCKER_MACHINE_HOME="/opt/docker-machine-0.16.0"
export DOCKER_BINDIR=${HOME}/.dotfiles/docker/bin
export PATH=$DOCKER_MACHINE_HOME:$DOCKER_BINDIR:$PATH

# Run this command to configure your shell:
# eval $(docker-machine env default)

#alias oc="docker exec -it openshift-master oc"

echo `docker-machine version`
