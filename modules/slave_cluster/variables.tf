
variable "dns_zone" {}

variable "hst_max" {}

variable "hst_size" {}

variable "hst_min" {}

variable "hst_des" {}

variable "security_group_id" {}

variable "aws_subnet_publicA_id" {}

variable "aws_subnet_publicB_id" {}

variable "env_name" {}

variable "ssh_key_name" {}

variable "ami" {}

variable "node_env_name" {}

variable "group_name" {
    default = ""
}

variable "k8stoken" {}

variable "master_ip" {}

variable "worker-userdata" {
    default = "worker.sh"
}




