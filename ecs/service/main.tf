provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {}
}

locals {
  name = "${var.env}-${var.name}"

  tags = merge(
    {
      Environment = var.env
      ManagedBy   = "Terraform"
    },
    var.tags
  )
}
