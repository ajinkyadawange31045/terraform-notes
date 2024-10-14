output "bucket_name" {
  value       = aws_s3_bucket.mybucket.bucket
  description = "The name of the S3 bucket"
}

