variable "aws_access_key" {
  description = "AWS Access Key"
  type        = string
}

variable "aws_secret_key" {
  description = "AWS Secret Key"
  type        = string
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "test-bucket-naga-nikhil" # Set a unique name for your bucket
}
