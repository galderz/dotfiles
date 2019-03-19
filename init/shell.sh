#!/usr/bin/env bash

set -e -x

echo "/usr/local/bin/bash" | sudo tee -a /etc/shells

sudo chsh -s /usr/local/bin/bash g
