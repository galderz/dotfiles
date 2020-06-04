source ~/.dotfiles/java/java14.sh
source ~/.dotfiles/ant/ant.sh

pushd ~/1/jdkjdk
git status

bash configure \
     --with-debug-level=slowdebug \
     --with-target-bits=64 \
     --with-boot-jdk=/opt/java-14 \
     --disable-warnings-as-errors \
     CC=/usr/bin/gcc \
     CXX=/usr/bin/g++
