terraform {
  required_version = "~> 1.3"
  backend "s3" {
    key = "k8s-demo/cluster/terraform.tfstate"
  }
}

module "k8s_cluster" {
  source = "./k8s-cluster"
}

module "k8s_services" {
  source     = "./k8s-services"
  depends_on = [module.k8s_cluster]
}
