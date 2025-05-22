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
