terraform {
  required_version = "~> 1.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.26.0"
    }

    dockerhub = {
      source  = "BarnabyShearer/dockerhub"
      version = "0.0.15"
    }

  }
}
