#!/usr/bin/env bash


source ~/.dotfiles/docker/docker-machine.sh
source ~/.dotfiles/go/golang.sh
source ~/.dotfiles/openshift/openshift-4.0.sh


# Change to operator directory
pushd $GOPATH/src/github.com/infinispan/infinispan-operator
git status


# Set docker machine environment variables
# If docker-machine not yet started it won't have effect
# If started it will be applied
eval "$(docker-machine env default)"
