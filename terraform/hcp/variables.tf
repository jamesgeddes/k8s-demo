variable "project" {
  description = "The name of the project that we are working on."
  type        = string
}

variable "region" {
  description = "The AWS region that we are deploying to"
}

variable "state_bucket" {
  description = "The Terraform state bucket in AWS S3"
}

variable "repo_owner" {
  description = "The org or individual who owns this repo"
}
