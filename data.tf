data "digitalocean_ssh_key" "main" {
#    name = var.ssh_key
     name = var.do_token
}

data "digitalocean_domain" "web" {
    name = var.domain_name
}

variable "domain_name" {}

