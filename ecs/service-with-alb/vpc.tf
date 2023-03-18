module "security_group_ecs" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.9"

  name        = "${local.name}-ecs"
  description = "Security group for ECS"
  vpc_id      = var.vpc_id

  ingress_cidr_blocks                   = var.ingress_cidr_blocks
  ingress_rules                         = var.ingress_rules
  ingress_with_source_security_group_id = var.ingress_with_source_security_group_id

  egress_rules = ["all-all"]

  tags = local.tags
}
