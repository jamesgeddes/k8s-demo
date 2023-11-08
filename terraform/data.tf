data "aws_availability_zones" "available" {}

data "github_repository" "current" {
  full_name = "${var.repo_owner}/${var.project}"
}

data "aws_route53_zone" "main" {
  name         = local.domain
  private_zone = false
}

data "hcp_vault_secrets_secret" "ARGOCD_ADMIN_PASSWORD" {
  app_name    = "${local.resource_prefix}-secrets"
  secret_name = "TF_VAR_ARGOCD_ADMIN_PASSWORD"
}

data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = ["${local.resource_prefix}-vpc"]
  }
}