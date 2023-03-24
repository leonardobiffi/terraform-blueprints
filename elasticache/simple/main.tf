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
}

module "redis" {
  source  = "cloudposse/elasticache-redis/aws"
  version = "0.49.0"

  name        = local.name
  description = var.description
  auth_token  = var.auth_token
  kms_key_id  = var.kms_key_id

  vpc_id                     = var.vpc_id
  availability_zones         = var.availability_zones
  subnets                    = var.subnets
  allowed_security_group_ids = var.allowed_security_group_ids
  cluster_size               = var.cluster_size
  instance_type              = var.instance_type
  apply_immediately          = true
  automatic_failover_enabled = var.automatic_failover_enabled
  engine_version             = var.engine_version
  family                     = var.family
  at_rest_encryption_enabled = var.at_rest_encryption_enabled
  transit_encryption_enabled = var.transit_encryption_enabled
  parameter                  = var.parameter
  replication_group_id       = var.replication_group_id
  multi_az_enabled           = var.multi_az_enabled
  maintenance_window         = var.maintenance_window

  cluster_mode_enabled                 = var.cluster_mode_enabled
  cluster_mode_num_node_groups         = var.cluster_mode_num_node_groups
  cluster_mode_replicas_per_node_group = var.cluster_mode_replicas_per_node_group

  final_snapshot_identifier = var.final_snapshot_identifier
  snapshot_retention_limit  = var.snapshot_retention_limit
  snapshot_window           = var.snapshot_window
  snapshot_name             = var.snapshot_name
  snapshot_arns             = var.snapshot_arns

  tags = local.tags
}
