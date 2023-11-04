package main

# Prevent GPU instance types for EC2
deny[msg] {
    input.resource_changes[_].type == "aws_instance"
    instance_type := input.resource_changes[_].change.after.instance_type
    startswith(instance_type, "p") == true
    msg = sprintf("EC2 instance %v is of a GPU-enabled type.", [input.resource_changes[_].address])
}

deny[msg] {
    input.resource_changes[_].type == "aws_instance"
    instance_type := input.resource_changes[_].change.after.instance_type
    startswith(instance_type, "g") == true
    msg = sprintf("EC2 instance %v is of a GPU-enabled type.", [input.resource_changes[_].address])
}
