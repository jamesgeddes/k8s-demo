locals {
  env          = terraform.workspace
  cluster_name = "eks-${local.env}"
}
