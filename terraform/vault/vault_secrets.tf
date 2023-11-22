resource "hcp_vault_secrets_app" "services" {
  for_each    = local.services_list
  app_name    = "${local.resource_prefix}-${each.value}"
  description = data.github_repository.current.description
}

resource "hcp_vault_secrets_app" "common" {
  app_name    = "${local.resource_prefix}-common"
  description = data.github_repository.current.description
}

resource "hcp_vault_secrets_secret" "argocd_admin_password" {
  app_name     = hcp_vault_secrets_app.common.app_name
  secret_name  = "TF_VAR_ARGOCD_ADMIN_PASSWORD"
  secret_value = random_password.argocd_admin_password.result
}
