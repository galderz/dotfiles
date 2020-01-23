#!/usr/bin/env bash

export OPENSHIFT_CLIENT_HOME="/opt/openshift-client-4.2"
export OPENSHIFT_INSTALL_HOME="/opt/openshift-install-4.2"

export PATH=$OPENSHIFT_CLIENT_HOME:${OPENSHIFT_INSTALL_HOME}:$PATH

# AWS profile for creating OpenShift clusters
export AWS_PROFILE=openshift-dev
