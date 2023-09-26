provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {}
}

locals {
  name        = "${var.env}-${var.app}"
  full_domain = var.subdomain != "" ? "${var.subdomain}.${var.domain_name}" : var.domain_name

  tags = merge(
    {
      Environment = var.env
      ManagedBy   = "Terraform"
    },
    var.tags
  )
}

module "cloudfront" {
  source  = "terraform-aws-modules/cloudfront/aws"
  version = "~> 3.2"

  aliases = [local.full_domain]

  comment             = "CloudFront for ${local.name}"
  enabled             = true
  is_ipv6_enabled     = true
  price_class         = "PriceClass_All"
  retain_on_delete    = false
  wait_for_deployment = false
  default_root_object = var.default_root_object
  http_version        = var.http_version

  create_origin_access_identity = var.create_origin_access_identity
  origin_access_identities      = var.origin_access_identities

  origin                 = var.origin
  default_cache_behavior = var.default_cache_behavior
  ordered_cache_behavior = var.ordered_cache_behavior
  custom_error_response  = var.custom_error_response

  viewer_certificate = {
    acm_certificate_arn      = var.acm_certificate_arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = var.minimum_protocol_version
  }

  tags = local.tags
}
