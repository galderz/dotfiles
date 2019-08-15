#!/usr/bin/env bash


source ~/.dotfiles/go/golang.sh
source ~/.dotfiles/kubernetes/minikube.sh

# Change to operator directory
pushd $GOPATH/src/github.com/infinispan/infinispan-operator
git status
