#!/usr/bin/env bash

source ~/.dotfiles/go/golang.sh
source ~/.dotfiles/openshift/openshift-4.1.sh

pushd $GOPATH/src/github.com/infinispan/infinispan-operator
git status
