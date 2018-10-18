#!/bin/bash -v

# install under AWS Ubuntu 16.04

sudo apt update && sudo apt upgrade

# install dependences
sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# import docker repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"

# import kubernetes repository
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

sudo bash -c 'cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF'

# update sources & install
sudo apt update

# install docker 17.03
sudo apt install -y docker-ce=$(apt-cache madison docker-ce | grep 17.03 | head -1 | awk '{print $3}')

# install kubeadm 1.9.2
sudo apt install -y kubelet=1.9.2-00 kubeadm=1.9.2-00 kubectl=1.9.2-00

sudo kubeadm init --kubernetes-version=1.9.2 --pod-network-cidr=192.168.0.0/16

mkdir -p $HOME/.kube && sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config && sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl apply -f https://docs.projectcalico.org/v2.6/getting-started/kubernetes/installation/hosted/kubeadm/1.6/calico.yaml