provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {}
}

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

module "nlb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "8.1.0"

  name               = local.name
  load_balancer_type = "network"
  vpc_id             = var.vpc_id

  subnet_mapping = [
    for i, eip in aws_eip.main : {
      allocation_id : eip.id, subnet_id : element(var.subnets, index(var.subnets, i))
    }
  ]

  http_tcp_listeners = var.http_tcp_listeners
  https_listeners    = var.https_listeners
  target_groups      = var.target_groups

  tags = local.tags
}

resource "aws_eip" "main" {
  for_each = toset(var.subnets)
  vpc      = true
}
