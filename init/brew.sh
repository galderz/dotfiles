#!/usr/bin/env bash

set -e -x

echo | /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install bash
brew install git
brew install gpg
brew install haskell-stack
brew install nvm
brew install unrar
brew install wget

brew tap d12frosted/emacs-plus
brew install emacs-plus --HEAD --with-natural-title-bars
