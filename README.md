# terraform-linode-instance

A simple Terraform module for creating instances in Linode.

## Module

Invoke this module from the root `main.tf` file.

```hcl
module "dbserver" {
  source              = "./modules/db"
  public_key_location = var.public_key_location
  root_password       = var.root_password
  region              = var.region
  db_node_count       = var.db_node_count
  db_instance_type    = var.db_instance_type
}
```
