provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {}
}

locals {
  name = "${var.env}-${var.name}"
  tags = merge(var.tags, {
    Environment = var.env
    ManagedBy   = "Terraform"
  })

  azs = slice(data.aws_availability_zones.available.names, 0, length(var.subnets))
}

data "aws_availability_zones" "available" {}

module "efs" {
  source  = "terraform-aws-modules/efs/aws"
  version = "~> 1.1"

  # File system
  name           = local.name
  creation_token = local.name
  encrypted      = var.encrypted
  kms_key_arn    = var.kms_key_arn

  performance_mode                = var.performance_mode
  throughput_mode                 = var.throughput_mode
  provisioned_throughput_in_mibps = var.provisioned_throughput_in_mibps

  lifecycle_policy = var.lifecycle_policy

  # File system policy
  attach_policy     = var.attach_policy
  policy_statements = var.policy_statements

  # Mount targets / security group
  mount_targets              = { for k, v in zipmap(local.azs, var.subnets) : k => { subnet_id = v } }
  security_group_description = "EFS security group"
  security_group_vpc_id      = var.vpc_id
  security_group_rules       = var.security_group_rules

  # Access point(s)
  access_points = var.access_points

  # Backup policy
  enable_backup_policy = var.enable_backup_policy

  # Replication configuration
  create_replication_configuration      = var.create_replication_configuration
  replication_configuration_destination = var.replication_configuration_destination

  tags = local.tags
}