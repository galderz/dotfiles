#!/usr/bin/env bash


set -e -x


# Use correct kubeconfig details
export KUBECONFIG=/tmp/openshift-dind-cluster/openshift/openshift.local.config/master/admin.kubeconfig
make copy-kubeconfig


# Expose console
docker-machine ssh default -L 9000:localhost:9000
