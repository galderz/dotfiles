#!/usr/bin/env bash


source ~/.dotfiles/openshift/minishift.sh
source ~/.dotfiles/go/golang.sh


# Change to operator directory
pushd $GOPATH/src/github.com/infinispan/infinispan-operator
git status
