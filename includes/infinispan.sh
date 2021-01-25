#!/usr/bin/env bash


source ~/.dotfiles/java/java11.sh
source ~/.dotfiles/maven/maven.sh
source ~/.dotfiles/maven/settings.sh

alias mc='mvn -s maven-settings.xml clean'
alias mb='mvn -s maven-settings.xml -DskipTests=true install'
alias mbp='mvn -s maven-settings.xml -DskipTests=true install --projects'
alias mcb='mvn -s maven-settings.xml -DskipTests=true clean install'
alias mcbp='mvn -s maven-settings.xml -DskipTests=true clean install --projects'
alias mt='mvn -s maven-settings.xml install'
alias mtp='mvn -s maven-settings.xml install --projects'
alias mct='mvn -s maven-settings.xml clean install'
alias mctp='mvn -s maven-settings.xml clean install --projects'

pushd ~/1/infinispan
git status
