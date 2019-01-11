source ~/.dotfiles/java/java8.sh

export GRAALVM_HOME="/opt/graalvm/Contents/Home"

export MVN_HOME="/opt/maven"
export MVN_BINDIR=$MVN_HOME"/bin"
export PATH=$MVN_BINDIR:$PATH

mvn -v
