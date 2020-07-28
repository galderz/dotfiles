#!/usr/bin/env zsh

set -e -x

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

pushd ${HOME}
rm .zpreztorc
ln -s .dotfiles/zsh/.zpreztorc

rm .zprofile
ln -s .dotfiles/zsh/.zprofile

rm .zshrc
ln -s .dotfiles/zsh/.zshrc
popd
