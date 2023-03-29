output "vpc_id" {
  description = "VPC ID"
  value       = var.vpc_id
}

output "security_group_id" {
  description = "Security Group ID"
  value       = module.security_group_elb.security_group_id
}

output "elb_arn" {
  description = "The ARN of the ELB"
  value       = module.alb.lb_arn
}

output "lb_dns_name" {
  description = "The DNS name of the load balancer."
  value       = module.alb.lb_dns_name
}

output "http_tcp_listener_arns" {
  description = "The ARN of the TCP and HTTP load balancer listeners created."
  value       = module.alb.http_tcp_listener_arns
}

output "https_listener_arns" {
  description = "The ARNs of the HTTPS load balancer listeners created."
  value       = module.alb.https_listener_arns
}

output "target_group_arns" {
  description = "ARNs of the target groups. Useful for passing to your Auto Scaling group."
  value       = module.alb.target_group_arns
}

output "target_group_names" {
  description = "Name of the target group. Useful for passing to your CodeDeploy Deployment Group."
  value       = module.alb.target_group_names
}

output "target_group_arns_by_name" {
  description = "Map of target group names Application to ARNs."
  value       = local.target_group_arns_by_name
}
