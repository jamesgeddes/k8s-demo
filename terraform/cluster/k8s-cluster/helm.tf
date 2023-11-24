resource "helm_release" "argocd" {
  name       = "${local.resource_prefix}-argocd"
  namespace  = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "5.48.0"

  set {
    name  = "server.admin.password"
    value = data.hcp_vault_secrets_secret.ARGOCD_ADMIN_PASSWORD.secret_value
  }
  set {
    name  = "server.admin.passwordMtime"
    value = "2021-01-01T00:00:00Z"
  }
}
