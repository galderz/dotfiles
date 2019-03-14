#!/usr/bin/env bash

set -e -x

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install bash
brew install git
brew install gpg
brew install haskell-stack
brew install nvm
brew install unrar
brew install wget

brew tap daviderestivo/emacs-head
brew install emacs-head --with-cocoa
brew install homebrew/emacs/magit
