resource "dockerhub_repository" "services" {
  for_each = local.services

  name             = "${var.project}-${each.value}"
  namespace        = var.dockerhub_namespace
  description      = "Repository for the ${var.project} ${each.value} service."
  full_description = "This repository contains Docker images for the ${each.value} service."
  private          = false
}
