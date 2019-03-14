#!/usr/bin/env bash

set -e -x

cd ~
ln -s ~/1/dotfiles .dotfiles
ln -s ~/.dotfiles/git/gitconfig .gitconfig
ln -s ~/.dotfiles/log.d .log.d
