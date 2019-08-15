#!/usr/bin/env bash

set -e -x

# Make the caps lock key act as control
# New security restrictions make it hard to automate:
# https://stackoverflow.com/questions/32907909/allow-applescript-script-to-run-without-asking-for-permission
# http://technicalgig.com/how-dropbox-hacks-your-mac/
osascript ./macos/capslock-to-control.scpt
