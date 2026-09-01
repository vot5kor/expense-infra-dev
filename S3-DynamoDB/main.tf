# ---------------------------------------------------
# S3 Bucket for Terraform Remote State
# ---------------------------------------------------
resource "aws_s3_bucket" "tf_remote_state" {
  bucket = "kvn-tf-remote-state-dev"
  force_destroy = true

  tags = {
    Name        = "kvn-tf-remote-state-dev"
    Environment = "dev"
    ManagedBy   = "terraform"
  }
}

resource "aws_s3_bucket_versioning" "tf_remote_state" {
  bucket = aws_s3_bucket.tf_remote_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

# resource "aws_s3_bucket_server_side_encryption_configuration" "tf_remote_state" {
#   bucket = aws_s3_bucket.tf_remote_state.id

#   rule {
#     apply_server_side_encryption_by_default {
#       sse_algorithm = "AES256"
#     }
#   }
# }

# resource "aws_s3_bucket_public_access_block" "tf_remote_state" {
#   bucket = aws_s3_bucket.tf_remote_state.id

#   block_public_acls       = true
#   block_public_policy     = true
#   ignore_public_acls      = true
#   restrict_public_buckets = true
# }

# ---------------------------------------------------
# DynamoDB Table for State Locking
# ---------------------------------------------------
resource "aws_dynamodb_table" "tf_remote_state_lock" {
  name         = "kvn-tf-remote-state-dev"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "kvn-tf-remote-state-dev"
    Environment = "dev"
    ManagedBy   = "terraform"
  }
}