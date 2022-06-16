data "digitalocean_ssh_key" "JP" {
  name = "JP"
}

data "digitalocean_domain" "web" {
    name = var.domain_name
}


