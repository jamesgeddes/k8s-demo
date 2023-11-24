module "grafana" {
  source  = "terraform-aws-modules/managed-service-grafana/aws"
  version = "2.1.0"

  name = "${local.resource_prefix}-workspace"

}
