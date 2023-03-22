provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {}
}

locals {
  name = "${var.env}-${var.name}"
  tags = merge(var.tags, {
    Environment = var.env
    ManagedBy   = "Terraform"
  })
}

module "ecs_service" {
  source  = "leonardobiffi/ecs-service/aws"
  version = "1.5.3"

  name = local.name

  subnet_ids         = var.private_subnets
  security_group_ids = [module.security_group_ecs.security_group_id]

  ecs_cluster_id  = var.cluster_id
  task_definition = "${module.ecs_task_definition.family}:${max(module.ecs_task_definition.revision, data.aws_ecs_task_definition.main.revision)}"

  target_group_arn       = var.target_group_arn
  target_container_name  = local.name
  target_port            = var.target_port
  port                   = var.container_port
  desired_count          = var.desired_count
  enable_execute_command = var.enable_execute_command

  launch_type       = var.launch_type
  platform_version  = var.platform_version
  task_network_mode = var.task_network_mode

  health_check_grace_period_seconds = var.health_check_grace_period_seconds
  multiples_target_groups           = var.multiples_target_groups

  autoscaling_enabled             = var.autoscaling_enabled
  autoscaling_min_capacity        = var.autoscaling_min_capacity
  autoscaling_max_capacity        = var.autoscaling_max_capacity
  autoscaling_cpu_target_value    = var.autoscaling_cpu_target_value
  autoscaling_memory_target_value = var.autoscaling_memory_target_value

  tags = local.tags
}

# Simply specify the family to find the latest ACTIVE revision in that family.
data "aws_ecs_task_definition" "main" {
  task_definition = module.ecs_task_definition.family
  depends_on      = [module.ecs_task_definition]
}

module "ecs_task_definition" {
  source  = "mongodb/ecs-task-definition/aws"
  version = "2.1.5"

  name                     = local.name
  family                   = local.name
  image                    = aws_ecr_repository.main.repository_url
  memory                   = var.memory
  cpu                      = var.cpu
  execution_role_arn       = aws_iam_role.ecs_tasks_execution_role.arn
  task_role_arn            = local.task_role_arn
  requires_compatibilities = var.launch_type == "EC2" ? ["EC2"] : ["FARGATE"]

  environment  = var.environment
  secrets      = concat(local.secrets, var.parameters)
  network_mode = var.task_network_mode

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
      "awslogs-group"         = aws_cloudwatch_log_group.this.name
      "awslogs-region"        = var.region
      "awslogs-stream-prefix" = "ecs"
    }
  }
}
