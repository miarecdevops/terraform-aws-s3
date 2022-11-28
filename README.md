# terraform module `s3`

terraform module to create an s3 bucket for audio file storage

## Module Variables

See [`variables.tf`](./variables.tf) for full list of variables

### Variables

- `s3_force_destroy` When true, data in bucket will be deleted so that the bucket can be destroyed without error. These objects are not recoverable.
- `s3_acl` Determines if S3 bucket should be accessible from public internet
- `environment` Name of environment (all tags will start with this name)
- `role` Role for this module, will be used in naming resources
- `tags` Tags to set on all resources

## Sample Module Calls

```hcl
module "bucket" {
  source = "./modules/s3"

  s3_force_destroy      = true
  s3_acl                = "private"

  # tagging / naming variables
  environment           = "environment"
  role                  = "storage"

  tags = {
    Role        = "storage"
  }
}
```

## Outputs

all ouputs are accessible module.module_name.output_name

- `bucket`  bucket name
- `region` region where bucket is deployed
