#!/usr/bin/env bash


set -e -x

VM_NAME=operator


# Start docker machine and set correct env variables
docker-machine start || true
eval "$(docker-machine env ${VM_NAME})"


# Remove any leftovers
docker rm -f openshift-node-1 openshift-master oc-cluster-up && rm -Rf /tmp/openshift*
docker-machine ssh ${VM_NAME} "sudo rm -Rf ls /tmp/openshift*"


# Create a route to access containers by IP address
# Needs to be deleted first, otherwise new routes don't get applied
sudo route delete 172.17.0.0/16
sudo route -n add -net 172.17.0.0/16 $(docker-machine ip ${VM_NAME})


echo "Start OpenShift 4 (type Ctrl+p Ctrl+q to leave it running)"

# Start openshift
pushd $GOPATH/src/github.com/infinispan/infinispan-operator
docker run -it -p 9000:9000 -v /tmp/:/tmp/ -v /var/run/docker.sock:/var/run/docker.sock gustavonalle/oc-cluster-up
#ci/start-okd-4.0.0.sh
