
# data "template_file" "master-userdata" {
#     template = "${file("${path.module}/${var.master-userdata}")}"

#     vars {
#         k8stoken  = "${var.k8stoken}"
#    }
# }

resource "aws_instance" "k8s-master" {
  ami           = "${var.ami}"
  count = "${var.instance_count}"
  instance_type = "t2.medium"
  subnet_id = "${var.aws_subnet_publicA_id}"
#   user_data = "${data.template_file.master-userdata.rendered}"
  key_name = "${var.ssh_key_name}"
  associate_public_ip_address = true
  vpc_security_group_ids = ["${var.security_group_id}"]

  #depends_on = ["var.aws_internet_gateway_gw"]
  provisioner "file" {
    source      = "../../secrets/sshkey"
    destination = "~/.ssh/sshkey"
  }

  tags {
      # Name = "${var.env_name}"
      Name = "${format("%s_%d", var.env_name, count.index + 1)}"
  }
}


