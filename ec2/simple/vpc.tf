module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.9"

  name        = local.name
  description = "Security group ${var.app}"
  vpc_id      = var.vpc_id

  ingress_cidr_blocks      = var.ingress_cidr_blocks
  ingress_with_cidr_blocks = var.ingress_with_cidr_blocks
  ingress_rules            = var.ingress_rules
  egress_rules             = var.egress_rules

  tags = local.tags
}
