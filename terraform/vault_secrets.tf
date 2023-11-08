resource "hcp_vault_secrets_app" "current" {
  for_each    = toset(var.list_of_environments)
  app_name    = "${var.gtld}-${var.project}-${each.value}-secrets"
  description = data.github_repository.current.description
}

resource "hcp_vault_secrets_secret" "argocd_admin_password" {
  for_each     = hcp_vault_secrets_app.current.for_each
  app_name     = "${var.gtld}-${var.project}-${each.value}-secrets"
  secret_name  = "TF_VAR_ARGOCD_ADMIN_PASSWORD"
  secret_value = random_password.argocd_admin_password[each.value].result
}
