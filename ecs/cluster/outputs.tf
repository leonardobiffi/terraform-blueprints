output "cluster_id" {
  description = "ID that identifies the cluster"
  value       = module.ecs_cluster.cluster_id
}

output "cluster_name" {
  description = "Name that identifies the cluster"
  value       = module.ecs_cluster.cluster_name
}
