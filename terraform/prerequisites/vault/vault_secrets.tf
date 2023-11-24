resource "hcp_vault_secrets_app" "services" {
  app_name    = "${local.resource_prefix}-${var.service}"
  description = "Secrets for ${each.value}"
}

resource "hcp_vault_secrets_app" "common" {
  app_name    = "${local.resource_prefix}-common"
  description = "Secrets for all services in ${var.project}"
}

resource "hcp_vault_secrets_secret" "argocd_admin_password" {
  app_name     = hcp_vault_secrets_app.common.app_name
  secret_name  = "TF_VAR_ARGOCD_ADMIN_PASSWORD"
  secret_value = random_password.argocd_admin_password.result
}
