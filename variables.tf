# Global Variables
variable "environment" {
  type        = string
  description = "Name of environment (all tags will start with this name)."
}

variable "role" {
  type        = string
  description = "Role for this module, will be used in naming resources."
}

variable "tags" {
  description = "Tags to set on all resources."
  type        = map(string)
}

variable "s3_force_destroy" {
  type        = bool
  description = "When true, data in bucket will be deleted so that the bucket can be destroyed without error. These objects are not recoverable."
}

variable "s3_acl" {
  description = "Determines if S3 bucket should be accessible from public internet"
  type        = string
}

variable "s3_versioning_enable" {
  type        = bool
  description = "When true, bucket versioning will be enabled"
  default = false
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
