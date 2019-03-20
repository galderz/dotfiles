.PHONY: dep emacs build image iterm2 macos push run clean ssh help

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

iterm2:
	init/iterm2.sh

git-remotes:
	init/git-remotes.sh

all: sudoers opt emacs symlinks brew shell brew-cask macos iterm2 git-remotes

fast: sudoers opt emacs symlinks brew shell macos iterm2 git-remotes


## Manual targets

virtualbox:
	init/virtualbox.sh

caps:
	macos/capslock-to-control.sh

# TODO make it non-manual (requires restore)
fonts:
	init/fonts.sh

# TODO make it non-manual (requires restore)
ssh:
	init/ssh.sh

# TODO make it non-manual
restore:
	init/restore.sh


## Host targets

backup:
	init/backup.sh
