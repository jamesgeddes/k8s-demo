module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.0.4"

  cluster_name    = "${local.resource_prefix}-eks"
  cluster_version = var.kubernetes_version

  vpc_id                         = var.vpc_id
  subnet_ids                     = var.private_subnet_ids
  cluster_endpoint_public_access = true

  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"

  }

  eks_managed_node_groups = {
    one = {
      name = "${local.resource_prefix}-ng1"

      instance_types = [var.instance_type]

      min_size     = 1
      max_size     = var.maximum_nodes
      desired_size = var.desired_nodes
    }
  }

  fargate_profiles = {
    default = {
      name       = "default"
      subnet_ids = var.private_subnet_ids
      selectors = [
        {
          namespace = "default"
          labels = {
            "env" = var.environment
          }
        },
        {
          namespace = "kube-system"
        }
      ]
    }
  }

}
