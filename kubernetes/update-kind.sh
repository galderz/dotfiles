#!/usr/bin/env bash

set -x -e

TMP_DIR=$(mktemp -d -t kind-XXXXXXXXXX)
KIND_VERSION=0.5.1

pushd ${TMP_DIR}
curl -Lo kind https://github.com/kubernetes-sigs/kind/releases/download/v${KIND_VERSION}/kind-$(uname)-amd64
chmod +x kind
KUBECTL_VERSION=$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)
curl -LO https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/darwin/amd64/kubectl
chmod +x kubectl
popd

KIND_DIR=/opt/kind-${KIND_VERSION}
mv ${TMP_DIR} ${KIND_DIR}

rm /opt/kind || echo "kind symlink does not exist"
ln -s ${KIND_DIR} /opt/kind

