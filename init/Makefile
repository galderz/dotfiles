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
	ln -s ~/.dotfiles/zsh/.p10k.zsh ~/.p10k.zsh
	ln -s ~/.dotfiles/emacs/.spacemacs ~/.spacemacs

install-brew:
	./install-brew.sh
	brew tap d12frosted/emacs-plus

brew:
	brew install \
		autoconf \
		emacs-plus \
		git \
		gpg \
		haskell-stack \
		ninja \
		python-yq \
		unrar \
		wget

shell:
	./shell.sh

brew-cask:
	brew cask install \
		1password \
		alfred \
		docker \
		dropbox \
		eclipse-java \
		intellij-idea \
		istat-menus \
		iterm2 \
		kindle \
		slack \
		skype \
		spotify \
		tunnelblick \
		vlc \
		xld \
		zulip

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
	pushd Volumes/M19TM/Backups.backupdb/m19/Latest/Macintosh\ HD\ -\ Data/Users/g; \
	rsync -va 0 ~/; \
	rsync -va .ssh ~/; \
	rsync -va .ssh.redhat ~/; \
	rsync -va .private.el ~/; \
	rsync -va .pypirc ~/; \
  rsync -va .authinfo.gpg ~/; \
	rsync -va .gnupg ~/ || true; \
  rsync -va Documents ~/; \
  rsync -va Dropbox ~/;
