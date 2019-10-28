export GRAALVM_HOME="${HOME}/1/mandrel/graal11/vm/latest_graalvm_home"
export GRAALVM_BIN="${GRAALVM_HOME}/bin"
export PATH=${GRAALVM_BIN}:$PATH

echo "### graal11 ###"
java -version
native-image --version
echo "### graal11 ###"
