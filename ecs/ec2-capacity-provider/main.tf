provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {}
}

locals {
  name               = "${var.env}-${var.app}"
  container_insights = var.env == "PRD" ? "enabled" : "disabled"

  tags = merge(
    {
      Environment = var.env
      ManagedBy   = "Terraform"
    },
    var.tags
  )
}

module "ecs_cluster" {
  source  = "terraform-aws-modules/ecs/aws"
  version = "~> 4.0"

  cluster_name = local.name

  cluster_configuration = {
    execute_command_configuration = {
      logging = "OVERRIDE"
      log_configuration = {
        cloud_watch_log_group_name = aws_cloudwatch_log_group.this.name
      }
    }
  }

  cluster_settings = {
    "name" : "containerInsights",
    "value" : local.container_insights
  }

  # Capacity provider - autoscaling groups
  autoscaling_capacity_providers = {
    "${local.name}-default" = {
      auto_scaling_group_arn         = module.autoscaling.autoscaling_group_arn
      managed_termination_protection = "ENABLED"

      managed_scaling = {
        minimum_scaling_step_size = var.min_scaling_size
        maximum_scaling_step_size = var.max_scaling_size
        status                    = "ENABLED"
        target_capacity           = var.scaling_target_capacity
      }

      default_capacity_provider_strategy = var.capacity_provider_strategy
    }
  }

  tags = local.tags
}

module "ecs_service" {
  source  = "leonardobiffi/ecs-service/aws"
  version = "0.0.3"

  name = local.name

  vpc_id             = var.vpc_id
  subnet_ids         = var.private_subnets
  security_group_ids = [module.security_group_ecs.security_group_id]

  ecs_cluster_id  = module.ecs_cluster.cluster_id
  task_definition = "${module.ecs_task_definition.family}:${max(module.ecs_task_definition.revision, data.aws_ecs_task_definition.main.revision)}"

  target_group_arn      = var.target_group_arn
  target_container_name = local.name
  target_port           = var.target_port
  port                  = var.container_port
  desired_count         = var.desired_count

  health_check_grace_period_seconds = var.health_check_grace_period_seconds

  tags = merge(local.tags, var.schedule_tag)
}

# Simply specify the family to find the latest ACTIVE revision in that family.
data "aws_ecs_task_definition" "main" {
  task_definition = module.ecs_task_definition.family
  depends_on      = [module.ecs_task_definition]
}

module "ecs_task_definition" {
  source  = "mongodb/ecs-task-definition/aws"
  version = "2.1.5"

  name               = local.name
  family             = local.name
  image              = aws_ecr_repository.this.repository_url
  memory             = var.memory
  cpu                = var.cpu
  execution_role_arn = aws_iam_role.ecs_tasks_execution_role.arn

  environment  = var.environment
  secrets      = var.secret
  network_mode = "awsvpc"

  portMappings = [
    {
      containerPort = var.container_port
      hostPort      = var.target_port
      protocol      = "tcp"
    },
  ]
  logConfiguration = {
    logDriver = "awslogs"
    options = {
      "awslogs-group"  = aws_cloudwatch_log_group.this.name
      "awslogs-region" = var.region
    }
  }
}

resource "aws_cloudwatch_log_group" "this" {
  name              = "/aws/ecs/${local.name}"
  retention_in_days = var.log_retention_days
  tags              = local.tags
}
