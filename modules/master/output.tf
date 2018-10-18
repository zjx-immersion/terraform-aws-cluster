output "rancher_master_dns" {
  value = "${aws_instance.rancher-master.public_dns}"
}

output "private_ip" {
  value = "${aws_instance.rancher-master.private_ip}"
}