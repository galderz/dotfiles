#!/usr/bin/env bash


source ~/.dotfiles/java/java11.sh
source ~/.dotfiles/java/graal11.sh


source ~/.dotfiles/maven/maven35.sh
source ~/.dotfiles/maven/settings.sh
alias mcb='mvn clean install -Dno-native -DskipTests'


pushd ~/1/quarkus/quarkus
git status
