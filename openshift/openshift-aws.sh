#!/usr/bin/env bash


# Set kubeconfig for aws
export KUBECONFIG=/Users/g/0/openshift/aws/latest/auth/kubeconfig


# Bring in oc client library
export OPENSHIFT_CLIENT_HOME="/opt/openshift-client-4.0"
source ~/.dotfiles/openshift/openshift.sh


# Add golang to path
source ~/.dotfiles/go/golang.sh


# Change to operator directory
pushd $GOPATH/src/github.com/infinispan/infinispan-operator
git status
