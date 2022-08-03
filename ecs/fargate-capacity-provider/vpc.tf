module "security_group_asg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.9"

  name        = "${local.name}-asg"
  description = "Security group for Autoscaling group"
  vpc_id      = var.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-${var.target_port}-tcp"]

  egress_rules = ["all-all"]

  tags = local.tags
}

module "security_group_ecs" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.9"

  name        = "${local.name}-ecs"
  description = "Security group for ECS"
  vpc_id      = var.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-${var.container_port}-tcp"]

  egress_rules = ["all-all"]

  tags = local.tags
}
