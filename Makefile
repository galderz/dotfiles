.PHONY: dep emacs build image iterm2 macos push run clean ssh help

.DEFAULT_GOAL := help


## Automated targets

sudoers:
	echo "g          ALL = (ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers

opt:
	sudo mkdir /opt
	pushd /opt; \
	sudo chown "$(whoami)" .; \
	popd

emacs:
	git clone https://github.com/syl20bnr/spacemacs .emacs.d

symlinks:
	ln -s ~/1/dotfiles .dotfiles
	ln -s ~/.dotfiles/git/gitconfig .gitconfig
	ln -s ~/.dotfiles/log.d .log.d

brew:
	echo | /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew install git
	brew install gpg
	brew install haskell-stack
	brew install unrar
	brew install wget
	brew tap d12frosted/emacs-plus
	brew install emacs-plus

shell:
	init/shell.sh

brew-cask:
	brew tap caskroom/cask
	brew cask install 1password
	brew cask install alfred
	brew cask install brave-browser
	brew cask install docker
	brew cask install dropbox
	brew cask install firefox
	brew cask install google-chrome
	brew cask install intellij-idea
	brew cask install istat-menus
	brew cask install iterm2
	brew cask install skype
	brew cask install spotify
	brew cask install tunnelblick
	brew cask install vlc
	brew cask install xld

macos:
	pushd ~/.dotfiles/macos ;\
	./mathias-macos; \
	./my-macos; \
	popd

iterm2:
	mkdir -p "~/Library/Application Support/iTerm2/DynamicProfiles"
	cp ~/.dotfiles/iterm2/my-profile.json "~/Library/Application Support/iTerm2/DynamicProfiles"

git-remotes:
	pushd ~/1/dotfiles; \
	git remote rm origin; \
	git remote add origin git@github.com:galderz/dotfiles.git; \
	popd

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

restore-repos:
	init/restore-repos.sh


## Host targets

backup:
	init/backup.sh

backup-repos:
	init/backup-repos.sh
