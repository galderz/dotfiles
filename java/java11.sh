export JAVA_HOME="/Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home"
export JRE_HOME=$JAVA_HOME"/jre"
export JAVA_BINDIR=$JAVA_HOME"/bin"
export JDK_HOME=$JAVA_HOME
export JAVA_ROOT=$JAVA_HOME
export PATH=$JAVA_BINDIR:$PATH

echo "### java11 ###"
java -version
echo "### java11 ###"
