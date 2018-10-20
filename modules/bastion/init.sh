#!/bin/bash -v

sudo apt-add-repository ppa:ansible/ansible

sudo apt update && sudo apt upgrade

sudo apt install git ansible -y
