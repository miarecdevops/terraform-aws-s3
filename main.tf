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

