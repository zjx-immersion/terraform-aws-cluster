output "rancher_master_dns" {
  value = "${autoscaling_group.k8s-nodes.}"
}