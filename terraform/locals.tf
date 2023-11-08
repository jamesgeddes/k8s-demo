locals {
  resource_prefix      = "${var.gtld}-${var.project}-${var.environment}"
  state_bucket         = "${var.repo_owner}-terraform-state"
  services             = toset(split(",", var.services))
  application_set_yaml = file("${path.module}/../argocd/application-set.yaml")
  application_set      = yamldecode(local.application_set_yaml)
  domain               = "${var.project}.${var.gtld}"

}
