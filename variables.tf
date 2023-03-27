# Global Variables
variable "environment" {
  type        = string
  description = "Name of environment (all tags will start with this name)."
}

variable "tags" {
  description = "Tags to set on all resources."
  type        = map(string)
}


variable "s3_force_destroy" {
  type        = bool
  description = "When true, data in bucket will be deleted so that the bucket can be destroyed without error. These objects are not recoverable."
}

# ACL variables
variable "s3_acl" {
  description = "Determines if S3 bucket should be accessible from public internet"
  type        = string
  default     = "private"
}

variable "s3_block_public_acls" {
  type        = bool
  description = "Whether Amazon S3 should block public ACLs for this bucket"
  default = true
}

variable "s3_block_public_policy" {
  type        = bool
  description = "Whether Amazon S3 should block public bucket policies for this bucket"
  default = true
}

variable "s3_ignore_public_acls" {
  type        = bool
  description = "Whether Amazon S3 should ignore public ACLs for this bucket"
  default = true
}

variable "s3_restrict_public_buckets" {
  type        = bool
  description = "Whether Amazon S3 should restrict public bucket policies for this bucket"
  default = true
}


# Versioning variables
variable "s3_versioning_enable" {
  type        = bool
  description = "When true, bucket versioning will be enabled"
  default = false
}

variable "s3_versioning_expire_days" {
  type        = number
  description = "A number of days after which to delete old versions"
  default = 30
}

variable "s3_server_side_encryption" {
  type        = bool
  description = "When true, Default Server Side Encryption will be enabled"
  default = false
}

variable "s3_encryption_sse_algorithm" {
  description = "Determines SSE Algorrithm used for server side encruyption, either AES256 or aws:kms"
  type        = string
  default     = "AES256"
}