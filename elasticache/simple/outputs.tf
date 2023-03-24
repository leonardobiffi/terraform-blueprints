output "id" {
  description = "Redis cluster ID"
  value       = module.redis.id
}

output "security_group_id" {
  description = "The ID of the created security group"
  value       = module.redis.security_group_id
}

output "security_group_name" {
  description = "The name of the created security group"
  value       = module.redis.security_group_name
}

output "port" {
  description = "Redis port"
  value       = module.redis.port
}

output "endpoint" {
  description = "Redis primary or configuration endpoint, whichever is appropriate for the given cluster mode"
  value       = module.redis.endpoint
}

output "reader_endpoint_address" {
  description = "The address of the endpoint for the reader node in the replication group, if the cluster mode is disabled."
  value       = module.redis.reader_endpoint_address
}

output "member_clusters" {
  description = "Redis cluster members"
  value       = module.redis.member_clusters
}

output "arn" {
  description = "Elasticache Replication Group ARN"
  value       = module.redis.arn
}

output "engine_version_actual" {
  description = "The running version of the cache engine"
  value       = module.redis.engine_version_actual
}
