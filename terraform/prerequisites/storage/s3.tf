resource "aws_s3_bucket" "artefacts" {
  bucket = "${local.resource_prefix}-artefacts"

}
