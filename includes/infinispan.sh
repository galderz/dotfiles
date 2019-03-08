#!/usr/bin/env bash


source ~/.dotfiles/maven/settings.sh
source ~/.dotfiles/java/java11.sh
source ~/.dotfiles/maven/aliases
# source ~/bin/git-completion
# source ~/bin/aliases

# export MAVEN_OPTS="$MAVEN_OPTS -Dlog4j.configuration=file:/opt/infinispan-log4j.xml"

pushd ~/1/infinispan
git status
