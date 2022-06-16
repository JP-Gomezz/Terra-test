

resource "digitalocean_droplet" "JP-Test1" {
    image = "ubuntu-20-04-x64"
    name = "JP-Test1"
    region = "nyc3"
    size = "s-1vcpu-1gb"
    ssh_keys = [
      data.digitalocean_ssh_key.JP.id
  ]

 #Connection setup
  connection {
    host = self.ipv4_address
    user = "root"
    type = "ssh"
    private_key = file("~/.ssh/id_rsa")
    timeout = "2m"
  }
  
 # #Mysql setup file transfer provisioner
 # provisioner "file" {
 #   source="/Users/bcmx/github/loadbalance/mysql-setup.sh"
 #   destination="/tmp/mysql-setup.sh"
 # }

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
