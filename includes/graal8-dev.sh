export SDKROOT=$(xcrun --show-sdk-path)

source ~/.dotfiles/java/java8-jvmci.sh

source ~/.dotfiles/java/mx.sh

pushd ~/1/legacy/graal-jdk8
git status

