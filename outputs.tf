output "bucket" {
  value = aws_s3_bucket.bucket.bucket
}

output "region" {
  value = aws_s3_bucket.bucket.region
}
