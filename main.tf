terraform {
  backend "remote" {
    organization = "priyanka_kaduluri"
    workspaces {
      name = "tfe-ws-deploy-aws-s3"
    }
  }
}


resource "aws_s3_bucket" "raw_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_name
    Environment = var.environment
  }
}
