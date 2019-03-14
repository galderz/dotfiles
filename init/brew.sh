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

# sudo chown -R g /usr/local/lib/pkgconfig
brew install --with-cocoa emacs
brew install homebrew/emacs/magit

brew cask install 1password
brew cask install alfred
brew cask install brave
brew cask install docker
brew cask install dropbox
brew cask install firefox
brew cask install gas-mask
brew cask install google-chrome
brew cask install intellij-idea
brew cask install istat-menus
brew cask install iterm2
brew cask install skype
brew cask install tunnelblick
brew cask install vlc
brew cask install xld
