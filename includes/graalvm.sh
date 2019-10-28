export SDKROOT=$(xcrun --show-sdk-path)

source ~/.dotfiles/java/jvmci8.sh
source ~/.dotfiles/java/mx.sh

pushd ~/1/mandrel/graal
git status
