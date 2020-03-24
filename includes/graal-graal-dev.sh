export SDKROOT=$(xcrun --show-sdk-path)

export JAVA_HOME="/opt/includes/graal-java"
source ~/.dotfiles/java/java.sh

source ~/.dotfiles/java/mx.sh
pushd ~/1/graal-graal/graal/substratevm
git status

