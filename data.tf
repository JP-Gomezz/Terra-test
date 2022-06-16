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
  
  
  
  provisioner "remote-exec" {
     inline = [
     "export PATH=$PATH:/usr/bin",
     # packages installation
     "sudo apt-get update",
     "curl -sSL https://repos.insights.digitalocean.com/install.sh | sudo bash",
     "sudo apt install -y nginx",
     "sudo apt -y install php8.0",
     "sudo apt-get install software-properties-common",
     "curl -sL https://deb.nodesource.com/setup_11.x | sudo -E bash -",
     "sudo apt-get install -y nodejs",
     "sudo wget https://wordpress.org/latest.zip",
     "sudo unzip latest.zip",
     "sudo apt-get install -y mysql-server",
     "chmod +x /tmp/mysql-setup.sh",
     "sudo /tmp/mysql-setup.sh"
     ]
  }
  
}
