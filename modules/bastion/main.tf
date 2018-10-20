
data "template_file" "init-userdata" {
    template = "${file("${path.module}/${var.init-userdata}")}"

  #   vars {
  #       k8stoken  = "${var.k8stoken}"
  #  }
}

resource "aws_instance" "k8s-master" {
  ami           = "${var.ami}"
  count = "${var.instance_count}"
  instance_type = "t2.medium"
  subnet_id = "${var.aws_subnet_publicA_id}"
  user_data = "${data.template_file.init-userdata.rendered}"
  key_name = "${var.ssh_key_name}"
  associate_public_ip_address = true
  vpc_security_group_ids = ["${var.security_group_id}"]

  #depends_on = ["var.aws_internet_gateway_gw"]

  connection {
      type = "ssh"
      # host = "${self.private_ip}"
      host = "${self.public_ip}"
      user = "ubuntu"
      agent = false
      private_key = "${file("../secrets/sshkey")}"
  }
  provisioner "file" {
    source      = "../secrets/sshkey"
    destination = "~/.ssh/id_rsa"
  }

  provisioner "remote-exec" {
    inline = [
        "sudo cp /home/ubuntu/.ssh/authorized_keys /root/.ssh/",
        "sudo cp /home/ubuntu/.ssh/id_rsa /root/.ssh/",
        "sudo chmod 400 /root/.ssh/id_rsa"
    ]
  }

  tags {
      # Name = "${var.env_name}"
      Name = "${format("%s_%d", var.env_name, count.index + 1)}"
  }
}


