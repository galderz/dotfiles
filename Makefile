.PHONY: dep build image push run clean help

.DEFAULT_GOAL := help


## Automated targets

sudoers:
	init/sudoers.sh

opt:
	init/opt.sh

emacs:
	init/emacs.sh

symlinks:
	init/symlinks.sh

macos:
	init/macos.sh

brew:
	init/brew.sh

git-remotes:
	init/git-remotes.sh

all: sudoers opt emacs symlinks brew macos git-remotes


## Manual targets

virtualbox:
	init/virtualbox.sh

manual: virtualbox
