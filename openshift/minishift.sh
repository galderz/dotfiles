#!/usr/bin/env bash


export MINISHIFT_HOME="/opt/minishift"
export PATH=$MINISHIFT_HOME:$PATH


MINISHIFT_VERSION=`minishift version`
MINISHIFT_VERSION=$(printf "%s", "$MINISHIFT_VERSION")
echo $MINISHIFT_VERSION

eval $(minishift oc-env)
