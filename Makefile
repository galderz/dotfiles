.PHONY: dep emacs build image iterm2 macos push run clean ssh help

.DEFAULT_GOAL := help

sudoers:
	echo "g          ALL = (ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers

opt:
	pushd /opt; \
	sudo chown "$(whoami)" .; \
	popd

emacs:
	git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

symlinks:
	ln -s ~/.dotfiles/git/gitconfig ~/.gitconfig
	ln -s ~/.dotfiles/log.d ~/.log.d

install-brew:
	echo | /usr/bin/ruby -e `curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)`
	brew tap d12frosted/emacs-plus

brew:
	brew install \
		git \
		gpg \
		haskell-stack \
		unrar \
		wget \
		python-yq \
		ninja \
		emacs-plus

shell:
	init/shell.sh

brew-cask:
	brew cask install \
		1password \
		alfred \
		autoconf \
		brave-browser \
		docker \
		dropbox \
		firefox \
		google-chrome \
		intellij-idea \
		istat-menus \
		iterm2 \
		skype \
		spotify \
		tunnelblick \
		vlc \
		xld

macos:
	pushd ~/.dotfiles/macos; \
	./mathias-macos; \
	./my-macos; \
	popd

git-remotes:
	pushd ~/.dotfiles; \
	git remote rm origin; \
	git remote add origin git@github.com:galderz/dotfiles.git; \
	popd

fast: sudoers opt emacs symlinks install-brew brew shell git-remotes macos

all: fast brew-cask

## Manual targets

sdkman:
	curl -s "https://get.sdkman.io" | bash
	source "$$HOME/.sdkman/bin/sdkman-init.sh"

virtualbox:
	init/virtualbox.sh

# TODO make it non-manual (requires restore)
fonts:
	init/fonts.sh

# TODO make it non-manual (requires restore)
ssh:
	init/ssh.sh

# TODO make it non-manual
restore:
	init/restore.sh

# TODO make it non-manual
restore-from-time-machine:
	pushd /Volumes/M19TM/Backups.backupdb/m19/Latest/Macintosh\ HD/Users/g; \
	cp -r 0 ~/; \
	mkdir ~/.m2; \
	cp .m2/settings ~/.m2; \
	cp -r .ssh ~/; \
	cp -r .ssh.redhat ~/; \
	cp .private.el ~/; \
	cp .pypirc ~/; \
	cp -r .gnupg ~/ || true; \
  cp -r Documents ~/; \
  cp -r Dropbox ~/;

restore-repos:
	init/restore-repos.sh


## Host targets

backup:
	init/backup.sh

backup-repos:
	init/backup-repos.sh
