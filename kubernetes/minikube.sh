#!/usr/bin/env bash


export MINIKUBE_HOME="/opt/minikube"
export KUBECTL_HOME="/opt/minikube"
export HELM_HOME="/opt/helm"
export KUBE_BIN_HOME="${HOME}/.dotfiles/kubernetes/bin"
export PATH=${KUBE_BIN_HOME}:${MINIKUBE_HOME}:${HELM_HOME}:$PATH

alias oc="kubectl"

echo `minikube version`
#echo `kubectl version`
#echo `helm version`
