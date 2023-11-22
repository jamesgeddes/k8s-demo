terraform {
  required_version = "~> 1.3"
  backend "s3" {

  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.46.0"
    }

    hcp = {
      source  = "hashicorp/hcp"
      version = "~> 0.76.0"
    }

    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }

  }
}
