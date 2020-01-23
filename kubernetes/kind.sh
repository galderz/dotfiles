export KIND_HOME="/opt/kind"
export PATH=${KIND_HOME}:$PATH

export KUBECONFIG="$(kind get kubeconfig-path --name="kind")"

alias oc="kubectl"
alias k="kubectl"

echo "### kind ###"
echo `kind version`
echo "### kind ###"

echo "### kubectl ###"
echo `kubectl version --short=true --client=true`
echo "### kubectl ###"

