locals {
  services_list = toset(jsondecode(var.services))

}