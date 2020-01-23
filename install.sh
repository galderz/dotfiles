#!/usr/bin/env bash

set -e -x

{ # this ensures the entire script is downloaded #

check=$((xcode-\select --install) 2>&1)
echo $check
str="xcode-select: note: install requested for command line developer tools"
while [[ "$check" == "$str" ]];
do
    osascript -e 'tell app "System Events" to display dialog "xcode command-line tools missing." buttons "OK" default button 1 with title "xcode command-line tools"'
    exit;
done

git clone https://github.com/galderz/dotfiles ~/.dotfiles
pushd ~/.dotfiles
make all
popd

} # this ensures the entire script is downloaded #
