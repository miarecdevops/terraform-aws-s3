// --------------------------------------------
// S3 Bucket
// --------------------------------------------
# Build S3 Bucket for Recording Storage
resource "aws_s3_bucket" "bucket" {
  bucket = "${var.bucket_name}"
  force_destroy = var.s3_force_destroy

  tags = var.tags
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.bucket.id
  acl    = var.s3_acl
}

# Block Public Access
resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = var.s3_block_public_acls
  block_public_policy     = var.s3_block_public_policy
  ignore_public_acls      = var.s3_ignore_public_acls
  restrict_public_buckets = var.s3_restrict_public_buckets
}

# Apply Version Control to S3 bucket
resource "aws_s3_bucket_versioning" "versioning" {
  count = var.s3_versioning_enable == true ? 1 : 0
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "delete_old_versions" {
  count = var.s3_versioning_enable == true ? 1 : 0
  bucket = aws_s3_bucket.bucket.id

  rule {
    id = "delete_old_versions"
    status = "Enabled"

    noncurrent_version_expiration {
      noncurrent_days = var.s3_versioning_expire_days
    }
  }
}

# Enable encryption on items in bucket
resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  count = var.s3_server_side_encryption == true ? 1 : 0
  bucket = aws_s3_bucket.bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = var.s3_encryption_sse_algorithm
    }
  }
}

# Create CORS permissions for access from Web servers
resource "aws_s3_bucket_cors_configuration" "bucket_cors" {
  bucket = aws_s3_bucket.bucket.id

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET"]
    allowed_origins = ["*"]
    expose_headers  = []
    max_age_seconds = 3000
  }
}