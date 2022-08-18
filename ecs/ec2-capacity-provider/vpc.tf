module "security_group_asg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.9"

  name        = "${local.name}-asg"
  description = "Security group for Autoscaling group"
  vpc_id      = var.vpc_id

  ingress_cidr_blocks = var.ingress_cidr_blocks
  ingress_rules       = length(var.ingress_cidr_blocks) > 0 ? ["http-${var.container_port}-tcp"] : []

  ingress_with_source_security_group_id = [
    for i in var.source_security_group_ids :
    {
      description              = "Allow access by security group"
      rule                     = "http-${var.container_port}-tcp"
      source_security_group_id = i
    }
  ]

  egress_rules = ["all-all"]

  tags = local.tags
}

module "security_group_ecs" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.9"

  name        = "${local.name}-ecs"
  description = "Security group for ECS"
  vpc_id      = var.vpc_id

  ingress_cidr_blocks = var.ingress_cidr_blocks
  ingress_rules       = length(var.ingress_cidr_blocks) > 0 ? ["http-${var.container_port}-tcp"] : []

  ingress_with_source_security_group_id = [
    for i in var.source_security_group_ids :
    {
      description              = "Allow access by security group"
      rule                     = "http-${var.container_port}-tcp"
      source_security_group_id = i
    }
  ]

  egress_rules = ["all-all"]

  tags = local.tags
}
