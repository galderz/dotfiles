#!/bin/sh

brew cask install java
brew install maven
brew install git
brew install wget
# brew install highlight
brew install unrar
brew install haskell-stack

# Ignore the warning saying to install the cask version
# because it does not work as well in terms of window
# management
brew install --with-cocoa emacs
brew install homebrew/emacs/magit


brew cask install iterm2
# brew cask install caskroom/versions/java7
brew cask install intellij-idea
brew cask install skype
# brew cask install notational-velocity
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
brew cask install tunnelblick
brew cask install brave
