output "arn" {
  description = "Amazon Resource Name of the file system"
  value       = module.efs.arn
}

output "id" {
  description = "The ID that identifies the file system (e.g., `fs-ccfc0d65`)"
  value       = module.efs.id
}

output "dns_name" {
  description = "The DNS name for the filesystem per [documented convention](http://docs.aws.amazon.com/efs/latest/ug/mounting-fs-mount-cmd-dns-name.html)"
  value       = module.efs.dns_name
}

output "security_group_arn" {
  description = "ARN of the security group"
  value       = module.efs.security_group_arn
}

output "security_group_id" {
  description = "ID of the security group"
  value       = module.efs.security_group_id
}