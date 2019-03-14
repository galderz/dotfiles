#!/usr/bin/env bash

set -e -x

sudo mkdir /opt
cd /opt
sudo chwon "$(whoami)" .
