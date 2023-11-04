package main

deny[msg] {
    input.resource_changes[_].type == "aws_s3_bucket"
    versioning_status = input.resource_changes[_].change.after.versioning[0].status
    not versioning_status == "Enabled"
    msg = sprintf("S3 Bucket %v does not have versioning enabled.", [input.resource_changes[_].change.after.bucket])
}
