#!/usr/bin/env bash

set -e -x

cd ~/1/dotfiles
git remote rm origin
git remote add origin git@github.com:galderz/dotfiles.git

# based on spacemacs
# cd ~/.emacs.d
# git remote rm origin
# git remote add origin git@github.com:galderz/prelude.git
