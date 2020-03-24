#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

#
# Aliases
#

# General aliases
alias 0='cd ~/0'
alias l='ls -lha'
alias c='clear'
alias untar='tar -xzvpf'
alias mktar='tar -czvpf'
alias gnubin='source ~/.dotfiles/gnubin.sh'

# Emacs aliases
alias e='emacsclient -t'
alias et='emacsclient -t'
alias ec='emacsclient -c'
alias vim='emacsclient -t'
alias vi='emacsclient -t'
alias el='emacs -q -l ~/0/dotfiles/log.d/log.el'
alias ed='emacs --daemon'
alias er='emacsclient -e "(kill-emacs)" && emacs --daemon && emacsclient -c &'

# Git aliases
source ~/.dotfiles/git/aliases

# Maven aliases
source ~/.dotfiles/maven/aliases

# Project aliases
alias hibernate="source ~/.dotfiles/includes/hibernate.sh"
alias infinispan="source ~/.dotfiles/includes/infinispan.sh"
alias jdg="source ~/.dotfiles/includes/jdg.sh"
alias jgroups="source ~/.dotfiles/includes/jgroups.sh"
alias quarkus8="source ~/.dotfiles/includes/quarkus8.sh"
alias quarkus-quarkus-dev="source ~/.dotfiles/includes/quarkus-quarkus-dev.sh"
alias quarkus-graal193-dev="source ~/.dotfiles/includes/quarkus-graal193-dev.sh"
alias operator="source ~/.dotfiles/includes/operator.sh"
alias operator-minikube="source ~/.dotfiles/includes/operator-minikube.sh"
alias operator-kind="source ~/.dotfiles/includes/operator-kind.sh"
alias operator-aws="source ~/.dotfiles/includes/operator-aws.sh"
alias olm="source ~/.dotfiles/includes/olm.sh"
alias adopt-openjdk="source ~/.dotfiles/includes/adopt-openjdk.sh"
alias jdk-dev="source ~/.dotfiles/includes/jdk-dev.sh"

alias graal-graal-dev="source ~/.dotfiles/includes/graal-graal-dev.sh"
alias graal-19.3-dev="source ~/.dotfiles/includes/graal-19.3-dev.sh"

# Java aliases
alias dump-threads="~/.dotfiles/java/dump-threads.sh"
alias untilfail="~/.dotfiles/java/untilfail.sh"
alias j11="source ~/.dotfiles/java/java11.sh"
alias j8="source ~/.dotfiles/java/java8.sh"
alias j8jvmci="source ~/.dotfiles/java/java8-jvmci.sh"
alias jboss-kill='pkill -9 -f ".*/java .* org.jboss.as.standalone .*" \
  || pkill -9 -f ".*/java .* org.jboss.as.process-controller .*"'
alias ps-rss="ps ax -o pid,rss,command | numfmt --header --from-unit=1024 --to=iec --field 2 | grep -v grep"

# Cloud aliases
alias oc41="source ~/.dotfiles/openshift/openshift-4.1.sh"
alias oc42="source ~/.dotfiles/openshift/openshift-4.2.sh"
alias google-cloud="source ~/.dotfiles/google/google-cloud.sh"
alias update-minikube="~/.dotfiles/kubernetes/update-minikube.sh"
alias update-kind="~/.dotfiles/kubernetes/update-kind.sh"

# External aliases
alias nodejs="source ~/.dotfiles/node.js/nodejs.sh"
alias golang="source ~/.dotfiles/go/golang.sh"

# Presentation aliases
alias putcachejpa="source ~/.dotfiles/includes/putcachejpa.sh"

#
# Functions
#

# Find any file
function fnd {
  find . -iname "*${1}*"
}

# Find class
function fnd-class {
    find "*${1}*" -name '*.jar' -exec grep -Hls "${2}" {} \;
}

#
# Themes
#
source ~/0/shell/polyglot/polyglot.sh
#source ~/0/shell/kube-ps1/kube-ps1.sh
#source ~/0/shell/polyglot-kube-ps1/polyglot-kube-ps1.sh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/g/.sdkman"
[[ -s "/Users/g/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/g/.sdkman/bin/sdkman-init.sh"
