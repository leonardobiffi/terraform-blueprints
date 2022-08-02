module "s3" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "3.3.0"

  bucket         = local.name
  force_destroy  = var.force_destroy
  lifecycle_rule = var.lifecycle_rule

  tags = var.tags
}

