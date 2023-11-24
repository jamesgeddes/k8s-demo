terraform {
  required_version = "~> 1.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.26.0"
    }

    hcp = {
      source  = "hashicorp/hcp"
      version = "~> 0.76.0"
    }

  }
}
