export MAVEN_OPTS="-server -XX:+UseConcMarkSweepGC -XX:+CMSIncrementalMode -XX:+UseParNewGC -XX:+CMSClassUnloadingEnabled -XX:NewRatio=4 -Xss500k -Xmx2G -Xms768M -XX:MaxPermSize=700M -XX:HeapDumpPath=$TMPDIR/java_heap -XX:ReservedCodeCacheSize=200M -Djava.net.preferIPv4Stack=true"
# -XX:+TieredCompilation
# -XX:+HeapDumpOnOutOfMemoryError 
# -XX:ReservedCodeCacheSize=200M needed by Infinispan
# -XX:+UseCompressedOops
# -Djava.net.preferIPv4Stack=true
# -Djgroups.bind_addr=127.0.0.1
