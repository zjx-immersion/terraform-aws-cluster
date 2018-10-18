/*
Copyright (c) 2016, UPMC Enterprises
All rights reserved.
Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name UPMC Enterprises nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL UPMC ENTERPRISES BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PR)
OCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
*/

variable "node-ssh-key" {}

# variable "k8stoken" {}

variable "region" {
  default = "ap-northeast-1"
}

variable "ami" {
  default = "ami-d39a02b5"
}

variable "ami_type" {
  type = "map"

  default = {
    eu-west-1    = "ami-481e232e"
    eu-west-2    = "ami-51776335"
    eu-central-1 = "ami-a71ecfc8"
    cn-north-1 = "ami-a87dafc5"
    ap-northeast-1 = "ami-d39a02b5"
  }
}

variable "master_size" {
  default = "t2.medium"
}

variable "hst_size" {
  default = "t2.medium"
}

variable "hst_max" {
  default = "0"
}

variable "hst_min" {
  default = "0"
}

variable "hst_des" {
  default = "0"
}

variable "slave_env_name" {
  default = "default"
}

