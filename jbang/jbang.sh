source ~/.dotfiles/java/java11.sh

export JBANG_HOME="${HOME}/.qollider/jbang"
export JBANG_BINDIR=$JBANG_HOME"/bin"
export PATH=$JBANG_BINDIR:$PATH

jbang version
