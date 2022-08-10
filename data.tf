data "digitalocean_domain" "web" {
    name = var.domain_name
}

data "template_file" "user_data" {
  
  template = file(var.cloud_init_file)
   vars = {
    do_token = var.do_token,
    #subdomain = var.subdomain
    #subdomain2 = var.subdomain2
    #domain_name = var.domain_name
    #fqdn=format("%s%s%s",var.subdomain,"." ,var.domain_name)
    #fqdn_dev=format("%s%s%s",var.subdomain,"." ,var.domain_name)
    #fqdn_stg=format("%s%s%s",var.subdomain2,".", var.domain_name)
    #email = var.certbot_email
    #mysql_root_Password = random_password.password[0].result
    #mysql_dev_Password = random_password.password[1].result
    #mysql_stg_Password = random_password.password[2].result
    #wp_dev_password = random_password.password[3].result
    #wp_stg_password = random_password.password[4].result
   }
}
