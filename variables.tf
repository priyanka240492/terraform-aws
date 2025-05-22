variable "bucket_name" {
  description = "This bucket is created by Github Actions"
  type        = string
  default = "sample-bucket-by-cicd"
}

variable "environment" {
  description = "DEV"
  type        = string
  default     = "dev"
}

variable "TFC_AWS_RUN_ROLE_ARN" {
  description = "AWS IAM Role ARN to be assumed by Terraform Cloud via OIDC"
  type        = string
}
