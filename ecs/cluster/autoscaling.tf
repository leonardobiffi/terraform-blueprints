module "autoscaling" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "~> 6.5"

  create = var.ec2_capacity_provider_enabled && var.enabled
  name   = local.name

  image_id      = jsondecode(data.aws_ssm_parameter.ecs_optimized_ami[0].value)["image_id"]
  instance_type = var.asg_instance_type

  security_groups                 = [module.security_group_asg.security_group_id]
  user_data                       = base64encode(local.user_data)
  ignore_desired_capacity_changes = true

  create_iam_instance_profile = true
  iam_role_name               = local.name
  iam_role_description        = "ECS role for ${local.name}"

  iam_role_policies = merge(var.iam_role_policies, {
    AmazonEC2ContainerServiceforEC2Role = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
    AmazonSSMManagedInstanceCore        = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  })

  vpc_zone_identifier   = var.private_subnets
  health_check_type     = "EC2"
  min_size              = 0
  max_size              = var.asg_max_scaling_size
  desired_capacity      = var.asg_min_scaling_size
  protect_from_scale_in = true

  autoscaling_group_tags = merge({
    AmazonECSManaged = true
  })

  enabled_metrics = [
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupPendingInstances",
    "GroupTerminatingInstances",
    "GroupTotalInstances"
  ]

  tags = local.tags
}

locals {
  user_data = <<-EOT
    #!/bin/bash
    cat <<'EOF' >> /etc/ecs/ecs.config
    ECS_CLUSTER=${module.ecs_cluster.cluster_id}
    EOF
  EOT
}

# https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html#ecs-optimized-ami-linux
data "aws_ssm_parameter" "ecs_optimized_ami" {
  count = var.ec2_capacity_provider_enabled && var.enabled ? 1 : 0
  name  = "/aws/service/ecs/optimized-ami/amazon-linux-2/recommended"
}

module "security_group_asg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.9"

  create      = var.ec2_capacity_provider_enabled && var.enabled
  name        = "${local.name}-asg"
  description = "Security group for Autoscaling group"
  vpc_id      = var.vpc_id

  ingress_cidr_blocks                   = var.ingress_cidr_blocks
  ingress_rules                         = var.ingress_rules
  ingress_with_source_security_group_id = var.ingress_with_source_security_group_id

  egress_rules = ["all-all"]

  tags = local.tags
}
