# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
alias operator="source ~/.dotfiles/includes/operator.sh"
alias operator-minikube="source ~/.dotfiles/includes/operator-minikube.sh"
alias operator-kind="source ~/.dotfiles/includes/operator-kind.sh"
alias operator-aws="source ~/.dotfiles/includes/operator-aws.sh"

alias maven-java="source ~/.dotfiles/maven/maven.sh && source ~/.dotfiles/java/java.sh"
alias maven-11="export JAVA_HOME=\"/opt/java-11\" && maven-java"
alias maven-14="export JAVA_HOME=\"/opt/java-14\" && maven-java"
alias maven-15="export JAVA_HOME=\"/opt/java-15\" && maven-java"

alias jbanging="source ~/.dotfiles/jbang/jbanging.sh"
alias jbanging-java="export JAVA_HOME=\"/opt/java-11\" && jbanging"


# JDK aliases
alias jdk-fastdebug-dev="source ~/.dotfiles/includes/jdk-fastdebug-dev.sh"
alias jdk-slowdebug-dev="source ~/.dotfiles/includes/jdk-slowdebug-dev.sh"
alias jdk-11-dev="source ~/.dotfiles/includes/jdk-11-dev.sh"


# GraalVM / Mandrel aliases
alias mandrel-mandrel-dev="source ~/.dotfiles/includes/mandrel-mandrel-dev.sh"
alias neo4j-load="~/.dotfiles/neo4j/neo4j-load.sh"


# QCC aliases
alias qcc-dev="maven-11 && pushd ~/1/qcc-qcc && git status"
alias qoccido-dev="maven-11 && jbanging && pushd ~/1/qoccido && git status"


# Java aliases
alias dump-threads="~/.dotfiles/java/dump-threads.sh"
alias untilfail="~/.dotfiles/java/untilfail.sh"
alias j11="source ~/.dotfiles/java/java11.sh"
alias j8="source ~/.dotfiles/java/java8.sh"
alias j8jvmci="source ~/.dotfiles/java/java8-jvmci.sh"
alias jboss-kill='pkill -9 -f ".*/java .* org.jboss.as.standalone .*" \
  || pkill -9 -f ".*/java .* org.jboss.as.process-controller .*"'
alias ps-rss="ps ax -o pid,rss,command | numfmt --header --from-unit=1024 --to=iec --field 2 | grep -v grep"
alias jmc="source ~/.dotfiles/includes/jmc.sh"


# Rust aliases
alias lang-rust="source $HOME/.cargo/env"
alias lightning-rust="lang-rust && pushd ~/2/rust-lightning && git status"

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
