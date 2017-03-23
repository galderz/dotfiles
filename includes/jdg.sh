source ~/.dotfiles/maven/settings.sh
source ~/.dotfiles/java/java8.sh

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
alias mt='./build.sh install'
alias mtp='./build.sh install --projects'
alias mct='./build.sh clean install'
alias mctp='./build.sh clean install --projects'

pushd ~/0/infinispan/jdg/git
git status
