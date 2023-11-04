package main

# Ensure no security groups allow open ingress on port 22
deny[msg] {
    input.resource_changes[_].type == "aws_security_group"
    rule = input.resource_changes[_].change.after.ingress[_]
    rule.from_port <= 22
    rule.to_port >= 22
    cidr_block = rule.cidr_blocks[_]
    cidr_block == "0.0.0.0/0"
    msg = sprintf("Security group %v allows unrestricted SSH access.", [input.resource_changes[_].change.after.name])
}