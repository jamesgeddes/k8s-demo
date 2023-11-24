resource "kubernetes_manifest" "application_set" {
  manifest = local.application_set
}

