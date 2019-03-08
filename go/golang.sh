#!/usr/bin/env bash


export GOHOME="/opt/go-1.11"
#export DEPHOME="/opt/dep-0.5.0-33-g14bef7d1"
export GOPATH=$HOME/1/go


export GOHOME_BIN=$GOHOME/bin
export GOPATH_BIN=$GOPATH/bin
export PATH=$GOHOME_BIN:$GOPATH_BIN:$DEPHOME:$PATH


echo `go env GOPATH`
echo `go version`
echo `dep version`

pushd $GOPATH
