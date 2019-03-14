#!/usr/bin/env bash

set -e -x

echo "g          ALL = (ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers
