source ~/.dotfiles/java/graal11-released.sh

source ~/.dotfiles/maven/maven35.sh
source ~/.dotfiles/maven/settings.sh
alias mcb='mvn clean install -Dno-native -DskipTests'

pushd ~/1/quarkus-graal11-released
git status
