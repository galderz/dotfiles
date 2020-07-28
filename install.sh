#!/usr/bin/env bash

set -e -x

{ # this ensures the entire script is downloaded #

git clone https://github.com/galderz/dotfiles ~/.dotfiles
pushd ~/.dotfiles
make all
popd

} # this ensures the entire script is downloaded #
