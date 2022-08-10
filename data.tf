data "template_file" "user_data" {
template = file("./cloud-init.yaml")
}
