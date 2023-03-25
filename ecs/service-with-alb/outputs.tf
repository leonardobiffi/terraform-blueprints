output "ecr_repository_url" {
  description = "The name of the ECR repository"
  value       = aws_ecr_repository.main.repository_url
}

output "ecr_repository_name" {
  description = "The name of the ECR repository"
  value       = aws_ecr_repository.main.name
}

output "ecr_repository_arn" {
  description = "The ARN of the ECR repository"
  value       = aws_ecr_repository.main.arn
}

output "ecs_service_id" {
  description = "The ARN of the ECS service"
  value       = module.ecs_service.id
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = var.vpc_id
}

output "subnet_ids" {
  description = "The IDs of the subnets"
  value       = var.private_subnets
}

output "security_group_ids" {
  description = "The IDs of the security groups"
  value       = [module.security_group_ecs.security_group_id]
}

output "ecs_tasks_role_arn" {
  description = "The ARN of the ECS tasks role"
  value       = local.task_role_arn
}

output "ecs_tasks_execution_role_arn" {
  description = "The ARN of the ECS tasks execution role"
  value       = aws_iam_role.ecs_tasks_execution_role.arn
}
