export JRE_HOME=$JAVA_HOME"/jre"
export JAVA_BINDIR=$JAVA_HOME"/bin"
export JDK_HOME=$JAVA_HOME
export JAVA_ROOT=$JAVA_HOME
export PATH=$JAVA_BINDIR:$PATH

export JTREG_HOME="/opt/jtreg"
export JTREG_BINDIR=$JTREG_HOME"/bin"
export PATH=$JTREG_BINDIR:$PATH

echo "### java ###"
java -XshowSettings:properties -version
java -Xinternalversion
echo "### java ###"

