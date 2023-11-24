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

    helm = {
      source  = "hashicorp/helm"
      version = "2.11.0"
    }

    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0.4"
    }

    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "~> 2.2.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.16.1"
    }
  }

  github = {
    source  = "integrations/github"
    version = "~> 5.0"
  }

  dockerhub = {
    source  = "BarnabyShearer/dockerhub"
    version = "0.0.15"
  }

}
