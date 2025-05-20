output "s3_bucket_name" {
  description = "Sample raw bucket provisioned via terraform"
  value       = aws_s3_bucket.raw_bucket.bucket
}
