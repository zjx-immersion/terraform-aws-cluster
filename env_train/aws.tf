provider "aws" {
  region = "${var.region}"
}

resource "aws_key_pair" "ssh-key" {
  key_name   = "k8s_train_env_key"
  public_key = "${var.node-ssh-key}"

  lifecycle {
    create_before_destroy = true
  }
}

module "vpc-tf" {
  source = "./../modules/vpc"

  region   = "${var.region}"
  vpc_name = "${var.vpc_name}"
}
