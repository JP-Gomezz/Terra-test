data "digitalocean_ssh_key" "JP" {
  name = "JP"
}

resource "digitalocean_domain" "default" {
   name = var.domain_name



  
}
