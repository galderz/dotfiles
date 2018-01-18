#!/usr/bin/env bash


export MINIKUBE_HOME="/opt/minikube"
export KUBECTL_HOME=""
export KUBE_BIN_HOME="/Users/g/0/dotfiles/kubernetes/bin"
export PATH=$KUBE_BIN_HOME:$MINIKUBE_HOME:$PATH

echo `minikube version`
#echo `kubectl version`
