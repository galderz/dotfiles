#!/usr/bin/env bash


export GRAALVM_HOME="/opt/graalvm/Contents/Home"
export GRAALVM_BIN="${GRAALVM_HOME}/bin"
export PATH=${GRAALVM_BIN}:$PATH

$GRAALVM_HOME/bin/native-image --version
