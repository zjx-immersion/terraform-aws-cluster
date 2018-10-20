module "k8s-nodes" {
  source                = "./../modules/master"
  ami                   = "${lookup(var.ami_type, var.region)}"
  security_group_id     = "${module.vpc-tf.aws_security_group_rancher_tf_id}"
  aws_subnet_publicA_id = "${module.vpc-tf.aws_subnet_publicA_id}"
  ssh_key_name          = "${aws_key_pair.ssh-key.key_name}"
  env_name              = "${var.env_name}-k8s-node"

  # k8stoken = "${var.k8stoken}"
  instance_count = 3
  ssh_private_key_path  = "../secrets/sshkey"
}
