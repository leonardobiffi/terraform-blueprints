output "ecr_repository_name" {
  description = "The name of the ECR repository"
  value       = local.name
}

output "ecr_repository_url" {
  description = "The URL of the ECR repository"
  value       = aws_ecr_repository.this.repository_url
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

output "cluster_id" {
  description = "ID that identifies the cluster"
  value       = module.ecs_cluster.cluster_id
}
