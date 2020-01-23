export MINIKUBE_HOME="/opt/minikube"
export KUBECTL_HOME="/opt/minikube"
export HELM_HOME="/opt/helm"
export KUBE_BIN_HOME="${HOME}/.dotfiles/kubernetes/bin"
export PATH=${KUBE_BIN_HOME}:${MINIKUBE_HOME}:${HELM_HOME}:$PATH

alias oc="kubectl"
alias k="kubectl"

echo `minikube version`
echo `kubectl version --short=true --client=true`
#echo `helm version`
