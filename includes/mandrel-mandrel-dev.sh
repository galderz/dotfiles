export SDKROOT=$(xcrun --show-sdk-path)

export JAVA_HOME="/opt/labsjdk-11-20.3"
source ~/.dotfiles/java/java.sh

source ~/.dotfiles/java/mx.sh

alias graal-style="mx eclipseformat -e /Applications/Eclipse\ Java.app/Contents/MacOS/eclipse --primary && mx checkstyle"

pushd ~/1/mandrel-mandrel/substratevm
# git status

