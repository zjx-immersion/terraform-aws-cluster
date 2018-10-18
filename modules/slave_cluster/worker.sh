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

# update insecure-registries
sudo mkdir -p /etc/docker
sudo touch /etc/docker/daemon.json
sudo cat <<EOT >> /etc/docker/daemon.json
{
  "insecure-registries": ["ec2-54-95-48-23.ap-northeast-1.compute.amazonaws.com:5000"]
}
EOT

# install docker 17.03
sudo apt install -y docker-ce=$(apt-cache madison docker-ce | grep 17.03 | head -1 | awk '{print $3}')

# install kubeadm 1.9.2
sudo apt install -y kubelet=1.9.2-00 kubeadm=1.9.2-00 kubectl=1.9.2-00

for i in {1..50}; do kubeadm join --token=${k8stoken} ${master_ip}:6443 --discovery-token-unsafe-skip-ca-verification && break || sleep 15; done
