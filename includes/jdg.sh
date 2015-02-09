source ~/.dotfiles/maven/settings.sh
source ~/.dotfiles/java/java7.sh

#
# Maven aliases specific to JDG
#

# Clean (c)
alias mc='./build.sh clean'

# Build (b)
alias mb='./build.sh -Dmaven.test.skip.exec=true install'
alias mcb='./build.sh -Dmaven.test.skip.exec=true clean install'

# Test (t)
alias mt='./build.sh test'
alias mct='./build.sh clean test'

pushd ~/0/infinispan/jdg.git
git status

