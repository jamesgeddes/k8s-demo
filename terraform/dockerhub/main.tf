terraform {
  required_version = "~> 1.3"
  backend "s3" {

  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.46.0"
    }

    dockerhub = {
      source  = "BarnabyShearer/dockerhub"
      version = "0.0.15"
    }

  }
}
