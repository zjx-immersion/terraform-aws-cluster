output "bastion_master_dns" {
  value = ["${aws_instance.k8s-master.*.public_dns}"]
}

output "bastion_public_ips" {
  value = ["${aws_instance.k8s-master.*.public_ip}"]
}