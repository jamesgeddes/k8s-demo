variable "gtld" {
  description = "The Generic top level domain that we are working in"
}

variable "project" {
  description = "The name of this project"
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

variable "services" {
  description = "JSON array of services"
  type        = string
}
