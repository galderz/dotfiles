#!/usr/bin/env bash

source ~/.dotfiles/kubernetes/kubernetes.sh


export OPENSHIFT_CLIENT_HOME="/opt/openshift-client"
export PATH=$OPENSHIFT_CLIENT_HOME:$PATH


OC_VERSION=`oc version`
OC_VERSION=$(printf "\nOpenShift: \n%s", "$OC_VERSION")
echo $OC_VERSION
