source ~/.dotfiles/java/java13.sh

pushd ~/1/jdkjdk
git status

bash configure \
     --with-debug-level=fastdebug \
     --with-target-bits=64 \
     --with-boot-jdk=/opt/java-13 \
     --disable-warnings-as-errors \
     CC=/usr/bin/gcc \
     CXX=/usr/bin/g++
