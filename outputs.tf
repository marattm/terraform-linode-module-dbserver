output "db_servers_private_ips" {
  value = linode_instance.db.*.private_ip_address
}
output "db_servers_public_ips" {
  value = linode_instance.db.*.ip_address
}
output "db_linode_ids" {
  value = linode_instance.db.*.id
}
