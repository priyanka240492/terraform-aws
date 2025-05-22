variable "bucket_name" {
  bucket = "sample-bucket-by-cicd"
  description = "This bucket is created by Github Actions"
  type        = string
}

variable "environment" {
  description = "DEV"
  type        = string
  default     = "dev"
}
