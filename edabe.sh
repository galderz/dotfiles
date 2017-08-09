#!/bin/sh

brew cask install java
brew install maven
brew install git
brew install wget
brew install highlight
brew install unrar
brew install homebrew/emacs/magit
brew install haskell-stack

# Please try the Cask for a better-supported Cocoa version:
#  brew cask install emacs
brew cask install emacs
brew services start emacs

brew cask install iterm2
brew cask install caskroom/versions/java7
brew cask install intellij-idea
brew cask install skype
brew cask install notational-velocity
brew cask install dropbox
brew cask install 1password
brew cask install alfred
brew cask install mailplane
brew cask install google-chrome
brew cask install firefox
brew cask install istat-menus
brew cask install vlc
brew cask install xld
brew cask install gas-mask
