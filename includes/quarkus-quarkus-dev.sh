export JAVA_HOME="/opt/includes/quarkus-graal"
source ~/.dotfiles/java/java.sh

source ~/.dotfiles/maven/maven35.sh
source ~/.dotfiles/maven/settings.sh
alias mcb='mvn clean install -Dno-native -DskipTests'

pushd ~/1/quarkus-quarkus
git status
