#!/usr/bin/env bash

# Get prerequisites
apt-get update && apt-get install -y apt-transport-https ca-certificates curl

# Get Kubernetes repository
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF

# Get Docker community repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

apt-get update

# Install required packages for kubeadm deploy
apt-get install -y docker-ce kubeadm kubectl kubelet kubernetes-cni
