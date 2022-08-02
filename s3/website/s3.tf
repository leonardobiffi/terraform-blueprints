module "s3" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "3.3.0"

  bucket        = local.name
  force_destroy = true

  versioning = {
    enabled = false
  }

  # S3 bucket-level Public Access Block configuration
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  website = {
    index_document = "index.html"
    error_document = "index.html"
  }

  tags = local.tags
}
