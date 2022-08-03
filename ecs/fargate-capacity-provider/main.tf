provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {}
}

locals {
  name               = "${var.env}-${var.app}"
  container_insights = var.env == "PRD" ? "enabled" : "disabled"

  tags = merge(
    {
      Environment = var.env
      ManagedBy   = "Terraform"
    },
    var.tags
  )
}
