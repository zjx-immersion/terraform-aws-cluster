output "master_dns" {
  value = ["${aws_instance.k8s-master.*.public_dns}"]
}

output "private_ips" {
  value = ["${aws_instance.k8s-master.*.private_ip}"]
}

output "public_ips" {
  value = ["${aws_instance.k8s-master.*.public_ip}"]
}