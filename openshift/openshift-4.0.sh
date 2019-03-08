#!/usr/bin/env bash


source ~/.dotfiles/docker/docker-machine.sh
source ~/.dotfiles/openshift/openshift-3.11.sh

OPENSHIFT_BINDIR=${HOME}/.dotfiles/openshift/bin
export PATH=$OPENSHIFT_BINDIR:$PATH
