export MAVEN_OPTS="-server -XX:+CMSClassUnloadingEnabled -XX:NewRatio=4 -Xss500k -Xmx2G -Xms768M -XX:HeapDumpPath=$TMPDIR/java_heap -XX:ReservedCodeCacheSize=200M -Djava.net.preferIPv4Stack=true"
# -XX:+TieredCompilation
# -XX:+HeapDumpOnOutOfMemoryError
# -XX:ReservedCodeCacheSize=200M needed by Infinispan
# -XX:+UseCompressedOops
# -Djava.net.preferIPv4Stack=true
# -Djgroups.bind_addr=127.0.0.1

#export MVN_HOME="/opt/maven"
#export MVN_BINDIR=$MVN_HOME"/bin"
#export PATH=$MVN_BINDIR:$PATH
#mvn -v
