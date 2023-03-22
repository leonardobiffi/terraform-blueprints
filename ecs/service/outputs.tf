output "ecr_repository_name" {
  description = "The name of the ECR repository"
  value       = local.name
}

output "ecr_repository_url" {
  description = "The URL of the ECR repository"
  value       = aws_ecr_repository.this.repository_url
}

output "subnet_ids" {
  description = "The IDs of the subnets"
  value       = var.private_subnets
}
