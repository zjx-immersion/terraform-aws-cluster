output "aws_subnet_publicA_id" {
  value = "${aws_subnet.publicA.id}"
}

output "aws_subnet_publicB_id" {
  value = "${aws_subnet.publicB.id}"
}

output "aws_security_group_rancher_tf_id" {
  value = "${aws_security_group.rancher-tf.id}"
}
