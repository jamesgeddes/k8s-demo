output "artefacts_bucket_url" {
  value = "s3://${aws_s3_bucket.artefacts.bucket}"
}