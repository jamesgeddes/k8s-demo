resource "aws_security_group" "alb_security_group" {
  name        = "${local.resource_prefix}-alb-sg"
  description = "ALB Security Group"
  vpc_id      = data.aws_vpc.selected.id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
