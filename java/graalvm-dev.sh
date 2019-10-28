export GRAALVM_HOME="/Users/g/1/mandrel/graal/vm/latest_graalvm_home"
export GRAALVM_BIN="${GRAALVM_HOME}/bin"
export PATH=${GRAALVM_BIN}:$PATH

$GRAALVM_HOME/bin/native-image --version
