// --------------------------------------------
// S3 Bucket
// --------------------------------------------
# Build S3 Bucket for Recording Storage
resource "aws_s3_bucket" "bucket" {
  bucket = "${var.environment}-${var.role}-bucket"
  force_destroy = var.s3_force_destroy

  tags = merge(
    var.tags,
    {
     Name = "${var.environment}-${var.role}-bucket"
    },
  )
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.bucket.id
  acl    = var.s3_acl
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