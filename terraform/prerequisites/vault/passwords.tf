resource "random_password" "argocd_admin_password" {
  length  = 16
  special = true
}
