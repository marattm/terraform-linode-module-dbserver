
resource "linode_sshkey" "mykey" {
  label   = "My SSH key"
  ssh_key = chomp(file(var.public_key_location))
}

resource "linode_instance" "db" {
  count           = var.db_node_count
  label           = "db_server-${count.index}"
  image           = "linode/ubuntu20.04"
  region          = var.region
  type            = var.db_instance_type
  authorized_keys = [linode_sshkey.mykey.ssh_key]
  root_pass       = random_string.password.result
  # root_pass       = var.root_password

  group      = "dbservers"
  tags       = ["demo"]
  private_ip = true


  connection {
    type = "ssh"
    user = "root"
    # password = var.root_password
    password = random_string.password.result
    host     = self.ip_address
  }

  # provisioner "file" {
  #   source      = "db_setup_script.sh"
  #   destination = "/tmp/setup_script.sh"
  # }

  # provisioner "remote-exec" {
  #   inline = [
  #     "chmod +x /tmp/db_setup_script.sh",
  #     "/tmp/db_setup_script.sh ${count.index + 1}",
  #   ]
  # }

  # provisioner "remote-exec" {
  #   inline = [
  #     # install NGINX
  #     "export PATH=$PATH:/usr/bin",

  #     "apt-get -q update",
  #     "mkdir -p /var/www/html/",
  #     "mkdir -p /var/www/html/healthcheck",
  #     "echo healthcheck > /var/www/html/healthcheck/index.html",
  #     "echo node ${count.index + 1} > /var/www/html/index.html",
  #     "apt-get -q -y install nginx",
  #   ]
  # }

}

