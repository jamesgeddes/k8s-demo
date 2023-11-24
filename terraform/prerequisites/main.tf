terraform {
  required_version = "~> 1.3"
  backend "s3" {
    key = "k8s-demo/prerequisites/terraform.tfstate"
  }
}

provider "hcp" {
  project_id = module.hcp_project.hcp_project_id
}

module "grafana" {
  source  = "./grafana"
  project = var.project
  gtld    = var.gtld
}

module "hcp_project" {
  source  = "./hcp_project"
  project = var.project
}

module "vault" {
  source     = "./vault"
  depends_on = [module.hcp_project.hcp_project_id]
  providers = {
    hcp = hcp
  }

  for_each = toset(jsondecode(var.services))

  project = var.project
  gtld    = var.gtld
  service = each.value
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