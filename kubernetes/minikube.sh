#!/usr/bin/env bash


export MINIKUBE_HOME="/opt/minikube"
export KUBECTL_HOME=""
export PATH=$MINIKUBE_HOME:$PATH

echo `minikube version`
#echo `kubectl version`
