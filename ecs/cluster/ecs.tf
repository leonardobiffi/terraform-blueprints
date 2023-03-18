locals {
  # Default capacity provider is Fargate
  fargate_capacity_providers = var.ec2_capacity_provider_enabled ? {} : {
    FARGATE = {
      default_capacity_provider_strategy = {
        weight = var.fargate_capacity_weight
        base   = var.fargate_capacity_base
      }
    }
    FARGATE_SPOT = {
      default_capacity_provider_strategy = {
        weight = var.fargate_spot_capacity_weight
        base   = var.fargate_spot_capacity_base
      }
    }
  }

  autoscaling_capacity_providers = var.ec2_capacity_provider_enabled == false ? {} : {
    "${local.name}-default" = {
      auto_scaling_group_arn         = module.autoscaling.autoscaling_group_arn
      managed_termination_protection = "ENABLED"

      managed_scaling = {
        minimum_scaling_step_size = var.asg_min_scaling_size
        maximum_scaling_step_size = var.asg_max_scaling_size
        status                    = "ENABLED"
        target_capacity           = var.asg_scaling_target_capacity
      }

      default_capacity_provider_strategy = var.asg_capacity_provider_strategy
    }
  }
}

module "ecs_cluster" {
  source  = "terraform-aws-modules/ecs/aws"
  version = "~> 4.0"

  create       = var.enabled
  cluster_name = local.name

  cluster_configuration = {
    execute_command_configuration = {
      logging = "OVERRIDE"
      log_configuration = {
        cloud_watch_log_group_name = local.cloudwatch_log_group_name
      }
    }
  }

  cluster_settings = {
    "name" : "containerInsights",
    "value" : var.container_insights
  }

  # Capacity providers
  fargate_capacity_providers     = local.fargate_capacity_providers
  autoscaling_capacity_providers = local.autoscaling_capacity_providers

  tags = local.tags
}
