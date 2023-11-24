resource "dockerhub_repository" "services" {
  name             = "${var.project}-${var.service}"
  namespace        = var.dockerhub_namespace
  description      = "Repository for the ${var.project} ${var.service} service."
  full_description = "This repository contains Docker images for the ${var.service} service."
  private          = false
}
