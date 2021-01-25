export SDKROOT=$(xcrun --show-sdk-path)

export JAVA_HOME="/opt/labsjdk-11-20.3"
source ~/.dotfiles/java/java.sh

source ~/.dotfiles/java/mx.sh

alias graal-style="mx eclipseformat -e /opt/eclipse/eclipse --primary && mx checkstyle"

pushd ~/1/mandrel-mandrel/substratevm

