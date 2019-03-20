#!/usr/bin/env bash

set -e -x

ITERM2_PROFILE_DIR="~/Library/Application\ Support/iTerm2/DynamicProfiles"

mkdir -p ${ITERM2_PROFILE_DIR}
cp ~/.dotfiles/iterm2/my-profile.json ${ITERM2_PROFILE_DIR}
