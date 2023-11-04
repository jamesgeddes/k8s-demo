data "aws_availability_zones" "available" {}

data "github_repository" "current" {
  full_name = "${var.repo_owner}/${var.project}"
}
