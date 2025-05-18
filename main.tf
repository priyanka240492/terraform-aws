resource "aws_s3_bucket" "raw_bucket_klp" {
  bucket = var.bucket_name
  acl    = "private"

  tags = {
    Name        = var.bucket_name
    Environment = var.environment
  }
}
