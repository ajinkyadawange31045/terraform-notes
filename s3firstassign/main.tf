resource "aws_s3_bucket" "mybucket" {
  bucket = var.bucket_name # Use the variable for the bucket name
}

# Block public access to the bucket
resource "aws_s3_bucket_public_access_block" "mybucket" {
  bucket = aws_s3_bucket.mybucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Enable versioning
resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.mybucket.id
  versioning_configuration {
    status = "Enabled" # Enable versioning
  }
}

# Enable server-side encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.mybucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"  # Default encryption using AES-256
    }
  }
}

# # Optionally set ACL to private (although this is redundant due to public access block)
# resource "aws_s3_bucket_acl" "mybucket" {
#   bucket = aws_s3_bucket.mybucket.id
#   acl    = "private"
# }








# resource "aws_s3_bucket" "mybucket" {
#   bucket = var.bucket_name # Use the variable for the bucket name
# }

# resource "aws_s3_bucket_acl" "mybucket" {
#   bucket = aws_s3_bucket.mybucket.id
#   acl    = "private"
# } 
# # for disabling versioning
# resource "aws_s3_bucket_versioning" "versioning_example" {
#   bucket = aws_s3_bucket.mybucket.id
#   versioning_configuration {
#     status = "Disabled"
#   }
# }

# resource "aws_s3_bucket_public_access_block" "mybucket" {
#   bucket = aws_s3_bucket.mybucket.id

#   block_public_acls       = true
#   block_public_policy     = true
#   ignore_public_acls      = true
#   restrict_public_buckets = true
# }


# resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
#   bucket = aws_s3_bucket.mybucket.id

#   rule {
#     apply_server_side_encryption_by_default {
#       kms_master_key_id = aws_kms_key.mykey.arn
#       sse_algorithm     = "aws:kms"
#     }
#   }
# }


