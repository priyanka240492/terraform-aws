output "s3_bucket_name" {
  description = "raw_bucket_klp"
  value       = aws_s3_bucket.raw_bucket_klp.bucket
}
