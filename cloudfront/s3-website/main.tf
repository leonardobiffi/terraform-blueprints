provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {}
}

locals {
  name        = "${var.env}-${var.app}"
  full_domain = "${var.subdomain}.${var.domain_name}"

  tags = merge(
    {
      Environment = var.env
      ManagedBy   = "Terraform"
    },
    var.tags
  )
}
