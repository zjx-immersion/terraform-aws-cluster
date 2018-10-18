#!/bin/bash -v

#apt-get update
#curl -sSL https://get.docker.com/ | sh
#systemctl start docker

#usermod -aG docker ubuntu

docker run --rm --privileged -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/rancher:/var/lib/rancher rancher/agent:v1.2.8 http://"${dns_zone}":8080/v1/scripts/"${reg_token}"
