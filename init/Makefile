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
	./shell.sh

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

# TODO make it non-manual (requires restore)
fonts:
	./fonts.sh

# TODO make it non-manual (requires restore)
ssh:
	./ssh.sh

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
  cp .authinfo.gpg ~/; \
	cp -r .gnupg ~/ || true; \
  cp -r Documents ~/; \
  cp -r Dropbox ~/;

# Try to use rsync:
# restore-repos:
# 	pushd /Volumes/M19TM/Backups.backupdb/m19/Latest/Macintosh\ HD/Users/g; \
# 	cp -r 1 ~/; \
# 	cp -r 2 ~/; \
# 	cp -r 3 ~/;


## Host targets

backup:
	init/backup.sh

backup-repos:
	init/backup-repos.sh
