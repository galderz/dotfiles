#!/usr/bin/env bash

export OPENSHIFT_CLIENT_HOME="/opt/openshift-client-4.1"
source ~/.dotfiles/openshift/openshift.sh

OPENSHIFT_BINDIR=${HOME}/.dotfiles/openshift/bin
export PATH=$OPENSHIFT_BINDIR:$PATH
