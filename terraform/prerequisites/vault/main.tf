terraform {
  required_version = "~> 1.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.26.0"
    }

    hcp = {
      source  = "hashicorp/hcp"
      version = "0.77.0"

    }

    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }

  }
}

provider "hcp" {
  project_id = var.hcp_project_id
}
