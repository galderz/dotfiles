#!/usr/bin/env bash


#source ~/.dotfiles/java/java8.sh
source ~/.dotfiles/java/graal.sh


source ~/.dotfiles/maven/settings.sh
alias mcb='mvn clean install -Dno-native -DskipTests'


pushd ~/1/quarkus/quarkus
git status
