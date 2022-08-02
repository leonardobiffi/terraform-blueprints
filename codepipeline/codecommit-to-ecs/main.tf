provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {}
}

data "aws_caller_identity" "default" {}

locals {
  name = "${var.env}-${var.app}"

  tags = merge(
    {
      Environment = var.env
      ManagedBy   = "Terraform"
    },
    var.tags
  )
}
