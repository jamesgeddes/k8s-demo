resource "github_repository_environment" "environments" {
  for_each = toset(var.environments)

  environment = each.value
  repository  = data.github_repository.current.name
  reviewers {
  }
  deployment_branch_policy {
    protected_branches     = false
    custom_branch_policies = false
  }
}

resource "random_password" "argocd_admin_password" {
  for_each = toset(var.environments)

  length  = 16
  special = true
}

resource "github_actions_environment_secret" "argocd_admin_password" {
  for_each = toset(var.environments)

  environment     = each.value
  secret_name     = "TF_VAR_ARGOCD_ADMIN_PASSWORD"
  plaintext_value = random_password.argocd_admin_password[each.value].result
  repository      = data.github_repository.current.name
}
