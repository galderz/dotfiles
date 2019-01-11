#!/usr/bin/env bash


export GOHOME="/opt/go-1.11"
export GOPATH=$HOME/1/go


export GOHOME_BIN=$GOHOME/bin
export GOPATH_BIN=$GOPATH/bin
export PATH=$GOHOME_BIN:$GOPATH_BIN:$PATH


echo `go env GOPATH`
echo `go version`
