locals {
  resource_prefix = "${var.gtld}-${var.project}"
  services_list   = toset(jsondecode(var.services))

}