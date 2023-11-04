resource "helm_release" "argocd" {
  name       = "argocd"
  namespace  = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "5.48.0"

  set {
    name  = "server.admin.password"
    value = pas
  }
  set {
    name  = "server.admin.passwordMtime"
    value = "2021-01-01T00:00:00Z"
  }
}
