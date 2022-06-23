
data "template_file" "user_data" {
template = file("./cloud-init.yaml")
}

resource "digitalocean_droplet" "JP-Test1" {
    image = var.image
    name = var.name
    region = var.region
    size = var.size
    ssh_keys = [
      data.digitalocean_ssh_key.JP.id
  ]


#Connection setup
 connection {
     host     = self.ipv4_address
     type     = "ssh"
     private_key = file(var.pkey)
     user     = "root"
     timeout  = "60m"
     agent = "false"
   }
  
    
 # #Mysql setup file transfer provisioner
 # provisioner "file" {
 #   source="/Users/bcmx/github/loadbalance/mysql-setup.sh"
 #   destination="/tmp/mysql-setup.sh"
 # }

#  provisioner "remote-exec" {
#     inline = [
#     "export PATH=$PATH:/usr/bin",
#     # packages installation
#      "sudo apt-get update",
#     "curl -sSL https://repos.insights.digitalocean.com/install.sh | sudo bash",
#     "sudo apt install -y nginx",
#     "sudo apt -y install php8.0",
#     "sudo apt-get install software-properties-common",
#     "curl -sL https://deb.nodesource.com/setup_11.x | sudo -E bash -",
#     "sudo apt-get install -y nodejs",
#     "sudo wget https://wordpress.org/latest.zip",
#     "sudo unzip latest.zip",
#     "sudo apt-get install -y mysql-server",
#     "chmod +x /tmp/mysql-setup.sh",
#    "sudo /tmp/mysql-setup.sh"
#     ]
#  }
}
