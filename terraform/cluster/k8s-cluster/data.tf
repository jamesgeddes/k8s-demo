data "hcp_vault_secrets_secret" "ARGOCD_ADMIN_PASSWORD" {
  app_name    = "${local.resource_prefix}-secrets"
  secret_name = "TF_VAR_ARGOCD_ADMIN_PASSWORD"
}
