## Rancher hosts + launch config + autoscaling group + security group

# User-data template
data "template_file" "userdata_hst" {
    template = "${file("${path.module}/${var.worker-userdata}")}"

   vars {
    master_ip  = "${var.master_ip}"
    # rancher_env_name = "${var.node_env_name}"
    k8stoken  = "${var.k8stoken}"
   }
}


# Hosts launch configuration

resource "aws_launch_configuration" "k8s-node" {
  image_id                    = "${var.ami}"
  instance_type               = "${var.hst_size}"
  key_name                    = "${var.ssh_key_name}"
  security_groups             = ["${var.security_group_id}"]
  associate_public_ip_address = true

  lifecycle {
    create_before_destroy = true
  }

  # user_data = "${data.template_file.userdata_hst.rendered}"

}

# Hosts autoscaling group

resource "aws_autoscaling_group" "k8s-nodes" {
  name                      = "${var.env_name}-nodes-${var.group_name}"
#   availability_zones        = ["${var.region}a", "${var.region}b"]
  launch_configuration      = "${aws_launch_configuration.k8s-master.name}"
  health_check_grace_period = 500
  health_check_type         = "EC2"
  max_size                  = "${var.hst_max}"
  min_size                  = "${var.hst_min}"
  desired_capacity          = "${var.hst_des}"
  vpc_zone_identifier       = ["${var.aws_subnet_publicA_id}", "${var.aws_subnet_publicB_id}"]

  tag {
    key                 = "Name"
    value               = "${var.env_name}-slave"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}
