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

brew:
	init/brew.sh

shell:
	init/shell.sh

brew-cask:
	init/brew-cask.sh

macos:
	init/macos.sh

git-remotes:
	init/git-remotes.sh

all: sudoers opt emacs symlinks brew shell brew-cask macos git-remotes

fast: sudoers opt emacs symlinks brew shell macos git-remotes


## Manual targets

virtualbox:
	init/virtualbox.sh

manual: virtualbox
