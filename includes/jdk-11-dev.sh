export JAVA_HOME="/opt/java-11-boot"
source ~/.dotfiles/java/java.sh
source ~/.dotfiles/ant/ant.sh

pushd ${HOME}/1/jdk11u-dev

bash configure \
     --with-debug-level=fastdebug \
     --with-target-bits=64 \
     --with-boot-jdk=${JAVA_HOME} \
     --disable-warnings-as-errors \
     CC=/usr/bin/gcc \
     CXX=/usr/bin/g++

git status
