source ~/.dotfiles/go/golang.sh
source ~/.dotfiles/kubernetes/kind.sh

# Change to operator directory
pushd $GOPATH/src/github.com/infinispan/infinispan-operator
git status
