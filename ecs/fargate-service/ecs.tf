module "ecs_service" {
  source  = "leonardobiffi/ecs-service/aws"
  version = "1.5.0"

  name       = local.name
  vpc_id     = var.vpc_id
  subnet_ids = var.private_subnets

  ecs_cluster_id  = var.cluster_id
  task_definition = "${module.ecs_task_definition.family}:${max(module.ecs_task_definition.revision, data.aws_ecs_task_definition.main.revision)}"

  desired_count          = var.desired_count
  enable_execute_command = var.enable_execute_command

  autoscaling_enabled             = var.autoscaling_enabled
  autoscaling_min_capacity        = var.autoscaling_min_capacity
  autoscaling_max_capacity        = var.autoscaling_max_capacity
  autoscaling_cpu_target_value    = var.autoscaling_cpu_target_value
  autoscaling_memory_target_value = var.autoscaling_memory_target_value

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

  name                     = local.name
  family                   = local.name
  image                    = aws_ecr_repository.this.repository_url
  memory                   = var.memory
  cpu                      = var.cpu
  execution_role_arn       = aws_iam_role.ecs_tasks_execution_role.arn
  task_role_arn            = var.task_role_arn != null ? var.task_role_arn : aws_iam_role.ecs_tasks_role[0].arn
  requires_compatibilities = ["FARGATE"]

  environment  = var.environment
  secrets      = var.secret
  network_mode = "awsvpc"

  logConfiguration = {
    logDriver = "awslogs"
    options = {
      "awslogs-group"         = aws_cloudwatch_log_group.this.name
      "awslogs-region"        = var.region
      "awslogs-stream-prefix" = "ecs"
    }
  }
}
