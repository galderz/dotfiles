#!/usr/bin/env bash


set -e -x


dotfiles() {
  git remote rm origin
  git remote add origin git@github.com:galderz/dotfiles.git
}


permissions() {
  # Make /opt
  sudo mkdir /opt
  cd /opt
  sudo chwon "$(whoami)" .
}


ansible() {
  sudo easy_install pip
  sudo pip install "ansible"
}


playbook() {
  mkdir ~/1/macos
  cd ~/1/macos
  git clone https://github.com/galderz/mac-dev-playbook
  cd mac-dev-playbook
  git remote rm origin
  git remote add origin git@github.com:galderz/mac-dev-playbook.git
  git remote add upstream https://github.com/geerlingguy/mac-dev-playbook
  ansible-galaxy install -r requirements.yml
  ansible-playbook main.yml -i inventory -K
}


emacs() {
  cd ~
  git clone https://github.com/galderz/prelude .emacs.d
  cd .emacs.d
  git remote rm origin
  git remote add origin git@github.com:galderz/prelude.git
}


symlinks() {
  cd ~
  ln -s ~/1/dotfiles .dotfiles
  ln -s ~/.dotfiles/git/gitconfig .gitconfig
  ln -s ~/.dotfiles/log.d .log.d
}


macos() {
  cd ~/1/dotfiles/macos
  ./mathias-macos
  ./my-macos
}


brew() {
  # Pre-requirement for emacs
  sudo chown -R "$(whoami)" /usr/local/lib/pkgconfig

  # Install emacs separately.
  # Ignore the warning saying to install the cask version,
  # because it does not work as well in terms of window management
  brew install --with-cocoa emacs
  brew install homebrew/emacs/magit

  # Installed last and outside Ansible due to issues with software provider
  # brew cask install virtualbox
}


main() {
  dotfiles
  permissions
  ansible
  playbook
  emacs
  symlinks
  ssh
  # TODO transfer files
  # TODO install fonts
  brew
  macos

  echo "Next, install virtualbox manually"
}


main
