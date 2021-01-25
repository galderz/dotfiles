#!/usr/bin/env bash

export GOLANG_HOME="/opt/go"
export GOLANG_BIN=$GOLANG_HOME/bin
export GOPATH="/opt/gopath"

export PATH=$GOLANG_BIN:$PATH

export GO111MODULE=auto

echo `go env GOPATH`
echo `go version`
