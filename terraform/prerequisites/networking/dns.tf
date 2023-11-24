resource "aws_route53_record" "domain" {
  for_each = { for env in var.list_of_environments : env => env }

  zone_id = data.aws_route53_zone.main.zone_id
  name    = each.value == "prod" ? local.domain : "${each.value}.${local.domain}"
  type    = "A"

  alias {
    name                   = aws_lb.eks_alb.dns_name
    zone_id                = aws_lb.eks_alb.zone_id
    evaluate_target_health = true
  }
}
