source ~/.dotfiles/gradle/aliases
source ~/.dotfiles/java/java8.sh

#
# Gradle aliases specific to Hibernate
#

# Build (b)
alias Gb='./gradlew build -xtest -xfindbugsMain -xfindbugsTest'

# Clean (c)
alias Gcb='./gradlew clean build -xtest -xfindbugsMain -xfindbugsTest'
alias Gct='./gradlew clean test -xfindbugsMain -xfindbugsTest'
alias Gctp='./gradlew clean test -xfindbugsMain -xfindbugsTest --project-dir'

# Test (t)
alias Gt='./gradlew test -xfindbugsMain -xfindbugsTest'
alias Gtp='./gradlew test -xfindbugsMain -xfindbugsTest --project-dir'

pushd ~/0/hibernate/orm.git
git status
