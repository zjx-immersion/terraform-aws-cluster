# module "rancher-nodes" {
#   source  = "./../modules/slave_cluster"
#   ami = "${lookup(var.ami_type, var.region)}"
#   dns_zone  = "${module.rancher-master.rancher_master_dns}"
#   hst_max = "${var.hst_max}"
#   hst_size = "${var.hst_size}"
#   hst_min = "${var.hst_min}"
#   hst_des = "${var.hst_des}"
#   security_group_id = "${module.vpc-tf.aws_security_group_rancher_tf_id}"
#   aws_subnet_publicA_id = "${module.vpc-tf.aws_subnet_publicA_id}"
#   aws_subnet_publicB_id = "${module.vpc-tf.aws_subnet_publicB_id}"
#   ssh_key_name = "${aws_key_pair.ssh-key.key_name}"
#   env_name = "${var.env_name}"
#   node_env_name = "${var.slave_env_name}"
#   master_ip = "${module.rancher-master.private_ip}"
#   k8stoken = "${var.k8stoken}"
# }

