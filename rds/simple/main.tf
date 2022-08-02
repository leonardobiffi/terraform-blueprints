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

module "rds" {
  source  = "terraform-aws-modules/rds/aws"
  version = "4.4.0"

  identifier = local.name

  engine         = var.engine
  engine_version = var.engine_version
  instance_class = var.instance_class

  allocated_storage     = var.allocated_storage
  max_allocated_storage = var.max_allocated_storage

  db_name                = var.db_name
  username               = var.username
  port                   = var.port
  create_random_password = true

  vpc_security_group_ids = [module.security_group.security_group_id]

  maintenance_window = "Sun:00:00-Sun:03:00"
  backup_window      = "03:00-06:00"

  # DB subnet group
  create_db_subnet_group = true
  subnet_ids             = var.subnet_ids

  # DB parameter group
  family               = var.family
  major_engine_version = var.major_engine_version
  parameters           = var.parameters

  deletion_protection   = var.deletion_protection
  apply_immediately     = var.apply_immediately
  skip_final_snapshot   = var.skip_final_snapshot
  copy_tags_to_snapshot = true

  create_db_option_group = false
  option_group_name      = var.option_group_name

  tags = local.tags
}
