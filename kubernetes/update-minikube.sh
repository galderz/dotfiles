#!/usr/bin/env bash

set -x -e

TMP_DIR=$(mktemp -d -t minikube-XXXXXXXXXX)

pushd ${TMP_DIR}
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-amd64
chmod +x minikube
MINIKUBE_VERSION=$(./minikube version | grep "version" | cut -d' ' -f3)
KUBECTL_VERSION=$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)
curl -LO https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/darwin/amd64/kubectl
chmod +x kubectl
popd

MINIKUBE_DIR=/opt/minikube-${MINIKUBE_VERSION}
mv ${TMP_DIR} ${MINIKUBE_DIR}

rm /opt/minikube || echo "Minikube symlink does not exist"
ln -s ${MINIKUBE_DIR} /opt/minikube

