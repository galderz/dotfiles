#!/usr/bin/env bash


export KUBETAIL_HOME="/opt/kubetail"
export PATH=$KUBECTL_HOME:$KUBETAIL_HOME:$PATH

echo `docker --version`

KUBECTL_VERSION=`kubectl version --short=true --client=true`
KUBECTL_VERSION=$(printf "kubectl %s" "$KUBECTL_VERSION")
echo $KUBECTL_VERSION


KUBETAIL_VERSION=$(printf "kubetail v%s" "$(kubetail --version)")
echo $KUBETAIL_VERSION
