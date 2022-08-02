module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 6.0"

  name               = local.name
  load_balancer_type = "application"

  vpc_id          = var.vpc_id
  subnets         = var.subnets
  security_groups = [module.security_group_elb.security_group_id]

  target_groups           = var.target_groups
  http_tcp_listeners      = var.http_tcp_listeners
  http_tcp_listener_rules = var.http_tcp_listener_rules
  https_listeners         = var.https_listeners
  https_listener_rules    = var.https_listener_rules

  tags = local.tags
}
