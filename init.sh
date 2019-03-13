#!/usr/bin/env bash


set -e -x


dotfiles() {
  git remote rm origin
  git remote add origin git@github.com:galderz/dotfiles.git
}


ansible() {
  xcode-select --install
  sudo easy_install pip
  sudo pip install "ansible"
}


playbook() {
  mkdir -p ~/1/macos
  cd !$
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


main() {
  dotfiles
  ansible
  playbook
  # TODO move to ansible
  emacs
}


main
