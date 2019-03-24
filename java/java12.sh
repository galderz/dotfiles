#!/usr/bin/env bash


export JAVA_HOME="/opt/java-12-oracle"
export JRE_HOME=$JAVA_HOME"/jre"
export JAVA_BINDIR=$JAVA_HOME"/bin"
export JDK_HOME=$JAVA_HOME
export JAVA_ROOT=$JAVA_HOME
export PATH=$JAVA_BINDIR:$PATH


java -version
