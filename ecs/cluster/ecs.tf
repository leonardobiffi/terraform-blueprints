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

  # Capacity provider
  fargate_capacity_providers = {
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

  tags = local.tags
}
