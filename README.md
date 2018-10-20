# Terraform for Rancher Cluster Launch

This repo include two ENV the one is for CI Cluster , another is for deployment Cluster

## Use example:

### 1.

>cd env_***

### 2.
>export AWS_ACCESS_KEY_ID=xxxxxxxxxxxx
export AWS_SECRET_ACCESS_KEY=xxxxxxxxxxxx

>terraform init -> Please read env_ci/env_dev.md for execting command configuration

### 3.TF_VAR_access_key and TF_VAR_secret_key are required which are generate in AWS

>../terraform plan -var node-ssh-key="$(cat ../secrets/sshkey.pub)" -var-file initialize.tfvars

### 4.Run terraform apply fist time to create Rancher Master and related AWS env

>../terraform apply -var node-ssh-key="$(cat ../secrets/k8skey.pub)" -var-file initialize.tfvars

### 5.Destroy the AWS of k8s cluster resources when you won't use it a period of time
>../terraform destroy -var node-ssh-key="$(cat ../secrets/k8skey.pub)" -var-file initialize.tfvars

### 6.SSH to the master node of k8s cluster
>ssh ubuntu@$(../terraform output bastion_dns) -i ../secrets/k8skey

### 7.Get the kubectl config in master server
>mkdir -p $HOME/.kube

>sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config

>sudo chown $(id -u):$(id -g) $HOME/.kube/config

### 8.Copy the config from master server to you local machine

>scp -i ../secrets/k8skey ubuntu@$(../terraform output bastion_dns):/home/ubuntu/.kube/config ./admin.conf

### 9.Test kubectl does work in you local or not

>export KUBECONFIG=admin.conf

>kubect get nodes

