output "aws_subnet_publicA_id" {
  value = "${aws_subnet.publicA.id}"
}

output "aws_subnet_publicC_id" {
  value = "${aws_subnet.publicC.id}"
}

output "aws_security_group_rancher_tf_id" {
  value = "${aws_security_group.rancher-tf.id}"
}
