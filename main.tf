terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"  # adjust version as needed
    }
  }

  backend "s3" {
    bucket         = "gh-cicd-tf-state-bucket"
    key            = "terraform/state.tfstate"
    region         = "us-east-1"
  }
  
}

resource "aws_s3_bucket" "raw_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_name
    Environment = var.environment
  }
}
