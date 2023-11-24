terraform {
  required_version = "~> 1.3"
  backend "s3" {
    key = "k8s-demo/prerequisites/terraform.tfstate"
  }
}

module "grafana" {
  source  = "./grafana"
  project = var.project
  gtld    = var.gtld
}

module "hcp" {
  source  = "./hcp"
  project = var.project
}

module "vault" {
  source     = "./vault"
  depends_on = [module.hcp]

  for_each = toset(jsondecode(var.services))

  project        = var.project
  gtld           = var.gtld
  hcp_project_id = var.hcp_project_id
  service        = each.value
}

module "dockerhub" {
  source     = "./dockerhub"
  depends_on = [module.vault]

  for_each = toset(jsondecode(var.services))

  dockerhub_namespace = var.dockerhub_namespace
  project             = var.project
  service             = each.value
}

module "iam" {
  source                 = "./iam"
  depends_on             = [module.dockerhub]
  account_id             = ""
  eks_cluster_issuer_url = ""
  eks_cluster_name       = ""
  eks_cluster_oidc_id    = ""
  region                 = ""
}

module "networking" {
  source     = "./networking"
  depends_on = [module.iam]
}

module "storage" {
  source  = "./storage"
  project = var.project
}