
variable "security_group_id" {}

variable "aws_subnet_publicA_id" {}

variable "ssh_key_name" {}

variable "ami" {}

variable "env_name" {}

variable "k8stoken" {}

variable "master-userdata" {
    default = "master.sh"
}
