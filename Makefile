.PHONY: dep build image push run clean help


.DEFAULT_GOAL := help


dotfiles:
	git remote rm origin
	git remote add origin git@github.com:galderz/dotfiles.git


opt:
	sudo mkdir /opt
	cd /opt
	sudo chown "$(whoami)" .


ansible:
	sudo easy_install pip
	sudo pip install "ansible"


playbook:
	mkdir ~/1/macos
	cd ~/1/macos
	git clone https://github.com/galderz/mac-dev-playbook
	cd mac-dev-playbook
	git remote rm origin
	git remote add origin git@github.com:galderz/mac-dev-playbook.git
	git remote add upstream https://github.com/geerlingguy/mac-dev-playbook
	ansible-galaxy install -r requirements.yml
	ansible-playbook main.yml -i inventory -K


emacs:
	cd ~
	git clone https://github.com/galderz/prelude .emacs.d
	cd .emacs.d
	git remote rm origin
	git remote add origin git@github.com:galderz/prelude.git


symlinks:
	cd ~
	ln -s ~/1/dotfiles .dotfiles
	ln -s ~/.dotfiles/git/gitconfig .gitconfig
	ln -s ~/.dotfiles/log.d .log.d


macos:
	cd ~/1/dotfiles/macos
	./mathias-macos
	./my-macos


# Install emacs separately:
# - pkgconfig: pre-requirement for emacs
# - Ignore the warning saying to install the cask version,
#   because it does not work as well in terms of window management install
brew:
	sudo chown -R "$(whoami)" /usr/local/lib/pkgconfig
	brew install --with-cocoa emacs
	brew install homebrew/emacs/magit


virtualbox:
	brew cask install virtualbox


## all:             Execute all tutorial steps
all: dotfiles opt ansible playbook emacs symlinks macos brew virtualbox
