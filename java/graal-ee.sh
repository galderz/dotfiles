#!/usr/bin/env bash


source ~/.dotfiles/java/java8.sh

export GRAALVM_HOME="/opt/graalvm-ee/Contents/Home"

export MVN_HOME="/opt/maven"
export MVN_BINDIR=$MVN_HOME"/bin"
export PATH=$MVN_BINDIR:$PATH

mvn -v
