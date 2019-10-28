#!/usr/bin/env bash

source ~/.dotfiles/wrk2/wrk2.sh
source ~/.dotfiles/kubernetes/minikube.sh
source ~/.dotfiles/java/graalvm.sh

export PLOT_URL=${HOME}/1/ext/hdrhistogram.git/GoogleChartsExample/plotFiles.html

pushd ${HOME}/1/putcachejpa
git status
