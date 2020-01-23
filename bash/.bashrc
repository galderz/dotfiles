#
# Editors
#

export EDITOR='emacsclient'
export VISUAL='emacsclient'
export PAGER='less'
export TERM=xterm-256color


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
alias graalvm="source ~/.dotfiles/includes/graalvm.sh"
alias infinispan="source ~/.dotfiles/includes/infinispan.sh"
alias jdg="source ~/.dotfiles/includes/jdg.sh"
alias jgroups="source ~/.dotfiles/includes/jgroups.sh"
alias quarkus8="source ~/.dotfiles/includes/quarkus8.sh"
alias quarkus11="source ~/.dotfiles/includes/quarkus11.sh"
alias operator="source ~/.dotfiles/includes/operator.sh"
alias operator-minikube="source ~/.dotfiles/includes/operator-minikube.sh"
alias operator-aws="source ~/.dotfiles/includes/operator-aws.sh"
alias olm="source ~/.dotfiles/includes/olm.sh"
alias graal11-dev="source ~/.dotfiles/includes/graal11-dev.sh"

# Java aliases
alias dump-threads="~/.dotfiles/java/dump-threads.sh"
alias untilfail="~/.dotfiles/java/untilfail.sh"
alias j12="source ~/.dotfiles/java/java12.sh"
alias jboss-kill='pkill -9 -f ".*/java .* org.jboss.as.standalone .*" \
  || pkill -9 -f ".*/java .* org.jboss.as.process-controller .*"'
alias ps-rss="ps ax -o pid,rss,command | numfmt --header --from-unit=1024 --to=iec --field 2 | grep -v grep"
#alias graalvm-dev="source ~/.dotfiles/java/graalvm-dev.sh"

# Cloud aliases
alias oc310="source ~/.dotfiles/openshift/openshift-3.10.sh"
alias oc311="source ~/.dotfiles/openshift/openshift-3.11.sh"
alias oc40="source ~/.dotfiles/openshift/openshift-4.0.sh"
alias oc41="source ~/.dotfiles/openshift/openshift-4.1.sh"
alias google-cloud="source ~/.dotfiles/google/google-cloud.sh"
alias ms="source ~/.dotfiles/openshift/minishift.sh"
alias mk="source ~/.dotfiles/kubernetes/minikube.sh"
alias openwhisk="source ~/.dotfiles/openwhisk/openwhisk.sh"
alias update-minikube="~/.dotfiles/kubernetes/update-minikube.sh"
#alias dmachine="source ~/.dotfiles/docker/docker-machine.sh"

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

# Add node to path by default (for React Native)
# export NVM_DIR=~/.nvm
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# nvm use 10.15 --silent


#
# Better defaults
#

SENSIBLE_BASH=${HOME}/0/bash/sensible/sensible.bash

if [ -f ${SENSIBLE_BASH} ]; then
     source ${SENSIBLE_BASH}
fi

# As close to autocomplete on zsh
#bind 'set show-all-if-ambiguous on'
#bind 'TAB:menu-complete'


#
# Prompt
#

if [ -t 1 ]
then
    PROMPT=~/0/bash/polyglot/polyglot.sh

    if [ -f ${PROMPT} ]; then
        source ${PROMPT}
    fi
fi
