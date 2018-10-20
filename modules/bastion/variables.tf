
variable "security_group_id" {}

variable "aws_subnet_publicA_id" {}

variable "ssh_key_name" {}

variable "ami" {}

variable "env_name" {}

# variable "k8stoken" {}
variable "instance_count" {
  default = 1
}
variable "ssh_private_key_path" {}

variable "init-userdata" {
    default = "init.sh"
}

