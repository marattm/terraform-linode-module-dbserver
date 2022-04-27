variable "public_key_location" {}
variable "root_password" {}
variable "region" {}
variable "db_node_count" {}
variable "db_instance_type" {}

resource "random_string" "password" {
  length  = 64
  special = true
  upper   = true
  lower   = true
  number  = true
}
