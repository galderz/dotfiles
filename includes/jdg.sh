source ~/.dotfiles/maven/settings.sh
source ~/.dotfiles/java/java7.sh

#
# Maven aliases specific to JDG
#

# Clean (c)
alias mc='./build.sh clean'

# Build (b)
alias mb='./build.sh -Dmaven.test.skip.exec=true install'
alias mbp='./build.sh -DskipTests=true install --projects'
alias mcb='./build.sh -Dmaven.test.skip.exec=true clean install'
alias mcbp='./build.sh -DskipTests=true clean install --projects'

# Test (t)
alias mt='./build.sh test'
alias mtp='./build.sh test --projects'
alias mct='./build.sh clean test'
alias mctp='./build.sh clean test --projects'

pushd ~/0/infinispan/jdg.git
git status

