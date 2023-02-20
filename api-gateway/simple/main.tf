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

module "api_gateway" {
  source  = "terraform-aws-modules/apigateway-v2/aws"
  version = "~> 2.2"

  name                         = local.name
  description                  = var.description
  protocol_type                = var.protocol_type
  cors_configuration           = var.cors_configuration
  api_key_selection_expression = var.api_key_selection_expression
  route_selection_expression   = var.route_selection_expression

  # Custom domain
  domain_name                 = var.domain_name
  domain_name_certificate_arn = var.domain_name_certificate_arn

  # Access logs
  default_stage_access_log_destination_arn = var.default_stage_access_log_destination_arn
  default_stage_access_log_format          = var.default_stage_access_log_format

  # Routes and integrations
  integrations = var.integrations
  authorizers  = var.authorizers

  # control the creation of the resources
  create_vpc_link        = var.create_vpc_link
  create_api_domain_name = var.domain_name != null ? true : false

  tags = local.tags
}
