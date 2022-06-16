data "digitalocean_ssh_key" "JP" {
  name = "JP"
}

resource "digitalocean_domain" "default" {
   name = var.domain_name


#connection setup

connection {
      host     = self.ipv4_address
      type     = "ssh"
      private_key = file("~/.ssh/id_rsa")
      user     = "root"
      timeout  = "60m"
      agent = "false"
    }
}
