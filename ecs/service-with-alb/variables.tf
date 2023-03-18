# REQUIRED

variable "region" {
  description = "The AWS region to use"
  type        = string
}

variable "name" {
  description = "The name of the service"
  type        = string
}

variable "env" {
  description = "The environment to use"
  type        = string
}

variable "cluster_id" {
  description = "The ECS cluster ID to use"
  type        = string
}

variable "container_port" {
  description = "The port to expose in the container"
  type        = number
}

variable "target_port" {
  description = "The target port exposed in the container"
  type        = number
}

variable "vpc_id" {
  description = "The VPC ID to use"
  type        = string
}

variable "private_subnets" {
  description = "The private subnets to use"
  type        = list(string)
}

variable "target_group_arn" {
  description = "The arn of the target group to point at the service containers."
  type        = string
}

# OPTIONAL

variable "health_check_grace_period_seconds" {
  description = "The health check grace period seconds to use in Service"
  type        = number
  default     = 0
}

variable "max_image_count" {
  description = "The maximum number of images to keep in ECR"
  type        = number
  default     = 10
}

variable "desired_count" {
  description = "The desired count of the service"
  type        = number
  default     = 1
}

variable "memory" {
  description = "The amount of memory to use in task"
  type        = number
  default     = 512
}

variable "cpu" {
  description = "The amount of CPU to use in task"
  type        = number
  default     = 256
}

variable "autoscaling_min_capacity" {
  description = "Min Capacity in Autoscaling"
  type        = number
  default     = 1
}

variable "autoscaling_max_capacity" {
  description = "Max Capacity in Autoscaling"
  type        = number
  default     = 1
}

variable "autoscaling_enabled" {
  description = "Whether to enable autoscaling"
  type        = bool
  default     = false
}

variable "autoscaling_cpu_target_value" {
  description = "The CPU target value in Autoscaling"
  type        = number
  default     = 0
}

variable "autoscaling_memory_target_value" {
  description = "The memory target value in Autoscaling"
  type        = number
  default     = 0
}

variable "scale_in_cooldown" {
  description = "The scale in cooldown in Autoscaling"
  type        = number
  default     = 120
}

variable "scale_out_cooldown" {
  description = "The scale out cooldown in Autoscaling"
  type        = number
  default     = 120
}

variable "log_retention_days" {
  description = "The number of days to keep logs"
  type        = number
  default     = 7
}

variable "environment" {
  description = "The environment variables to use in Container"
  type        = list(map(string))
  default     = []
}

variable "secrets" {
  description = "List of secrets to fetch from AWS Secrets Manager and use in Container"
  type = list(object({
    name = string
    keys = list(string)
  }))
  default = []
}

variable "parameters" {
  description = "List of parameters to use in Container"
  type = list(object({
    name      = string
    valueFrom = string
  }))
  default = []
}

variable "ingress_cidr_blocks" {
  description = "The ingress cidr blocks to use in Service"
  type        = list(string)
  default     = []
}

variable "ingress_with_source_security_group_id" {
  description = "The ingress with source security group id to use in Service"
  type        = list(map(string))
  default     = []
}

variable "ingress_rules" {
  description = "The ingress rules to use in Service"
  type        = list(string)
  default     = []
}

variable "task_role_arn" {
  description = "The short name or full Amazon Resource Name (ARN) of the IAM role that containers in this task can assume"
  type        = string
  default     = null
}

variable "enable_execute_command" {
  description = "Whether to enable execute command. Valid values are true or false."
  type        = bool
  default     = true
}

variable "multiples_target_groups" {
  description = "The multiples target groups to attach to the service."
  type = list(object({
    target_group_arn = string
    container_name   = string
    container_port   = string
  }))
  default = []
}

variable "policy_statement" {
  description = "The policy statements to use in Task Role"
  type = list(object({
    sid       = optional(string)
    effect    = string
    actions   = list(string)
    resources = list(string)
  }))
  default = []
}

variable "tags" {
  description = "Additional tags to use"
  type        = map(string)
  default     = {}
}
