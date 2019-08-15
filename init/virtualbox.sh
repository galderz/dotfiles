#!/usr/bin/env bash

set -e -x

# Install virtual box
brew cask install virtualbox

# Install ext pack
(
  cd /tmp;
  vbox_full_version=$(brew cask info virtualbox | head -1 | cut -d' ' -f2 | cut -d',' -f1);
  vbox_short_version=${vbox_full_version/-*};
  curl -L -O http://download.virtualbox.org/virtualbox/${vbox_short_version}/Oracle_VM_VirtualBox_Extension_Pack-${vbox_full_version}.vbox-extpack;
  sudo VBoxManage extpack install --replace Oracle_VM_VirtualBox_Extension_Pack-${vbox_full_version}.vbox-extpack;
  rm *.vbox-extpack;
)
