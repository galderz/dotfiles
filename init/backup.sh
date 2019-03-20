#!/usr/bin/env bash

set -e -x

BACKUP=/Volumes/Backup/Backup

# Make backup dir
mkdir ${BACKUP} || true

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
cp ~/.gnupg ${BACKUP}

# Documents
cp ~/Documents ${BACKUP}

# Dropbox data
cp ~/Dropbox ${BACKUP}
