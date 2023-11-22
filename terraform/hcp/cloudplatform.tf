resource "hcp_project" "main" {
  name        = var.project
  description = data.github_repository.current.description
}
