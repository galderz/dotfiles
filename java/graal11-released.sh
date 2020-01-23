export GRAALVM_HOME="/opt/graal-11-released"
export GRAALVM_BIN="${GRAALVM_HOME}/bin"

export JAVA_HOME="${GRAALVM_HOME}"
export JRE_HOME=$JAVA_HOME"/jre"
export JAVA_BINDIR=$JAVA_HOME"/bin"
export JDK_HOME=$JAVA_HOME
export JAVA_ROOT=$JAVA_HOME

export PATH=$JAVA_BINDIR:$PATH
export PATH=${GRAALVM_BIN}:$PATH

echo "### graal11 ###"
java -version
native-image --version
echo "### graal11 ###"
