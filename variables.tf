
variable "image" {
  type = string
  default = "ubuntu-20-04-x64"
}

variable "name"{
  type = string
  default = "JP-Test1"

}

variable "region" {
  type = string
  default = "sfo3"

}

variable "size" {
  type = string
  default = "s-1vcpu-1gb"

}

variable "pkey" {
  type = string
  default = "~/.ssh/id_rsa"

}

variable cloud_init_file {
    type = string
}

variable domain_name {
    type = string
}






