#!/usr/bin/env bash

{ # this ensures the entire script is downloaded #

xcode-select --install

mkdir ~/1 && cd ~/1 || exit
git clone https://github.com/galderz/dotfiles
cd dotfiles || exit

# TODO Re-enable once verified all targets work as expected
#make all

} # this ensures the entire script is downloaded #
