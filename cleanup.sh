#!/usr/bin/env bash

brew cleanup --prune=0

rm ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/Docker.qcow2

rm -rf ~/.m2/repository
