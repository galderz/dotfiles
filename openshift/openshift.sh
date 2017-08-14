#!/usr/bin/env bash


export OPENSHIFT_CLIENT_HOME="/opt/openshift-client"
export KUBETAIL_HOME="/opt/kubetail"
export PATH=$OPENSHIFT_CLIENT_HOME:$KUBETAIL_HOME:$PATH


oc version

KUBETAIL_VERSION=$(printf "kubetail v%s" "$(kubetail --version)")
echo $KUBETAIL_VERSION
