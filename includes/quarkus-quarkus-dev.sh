export JAVA_HOME="/opt/includes/quarkus-graal"
source ~/.dotfiles/java/java.sh

source ~/.dotfiles/maven/maven35.sh
source ~/.dotfiles/maven/settings.sh
alias mcb='mvn clean install -DskipTests'
alias mb='mvn install -Dno-format -DskipTests'
alias mcbs='mvn clean install -Dformat.skip -Denforcer.skip -DskipTests -DskipITs'
alias mbs='mvn install -Dformat.skip -DskipTests'

pushd ~/1/quarkus-quarkus
git status
