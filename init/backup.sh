#!/usr/bin/env bash

set -e -x

BACKUP=/Volumes/Backup/Backup

# Remake backup dir
rm -drf ${BACKUP}
mkdir ${BACKUP}

# Private files
cp -r ~/0 ${BACKUP}

# Maven settings
mkdir ${BACKUP}/.m2
cp ~/.m2/settings.xml ${BACKUP}/.m2

# SSH
cp -r ~/.ssh ${BACKUP}

# Freenode credentials
cp ~/.private.el ${BACKUP}

# Pyp credentials
cp ~/.pypirc ${BACKUP}

# GPG
# Avoid errors related to copying sockets
cp -r ~/.gnupg ${BACKUP} || true

# Documents
cp -r ~/Documents ${BACKUP}

# Dropbox data
cp -r ~/Dropbox ${BACKUP}
