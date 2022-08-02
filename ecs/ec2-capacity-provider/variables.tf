variable "region" {
  description = "The AWS region to use"
  type        = string
  default     = "us-east-1"
}

variable "app" {
  description = "The name of the app"
  type        = string
}

variable "env" {
  description = "The environment to use"
  type        = string
}

variable "instance_type" {
  description = "The instance type to use in AutoScalingGroup"
  type        = string
}

variable "min_scaling_size" {
  description = "The minimum number of instances to keep in AutoScalingGroup"
  type        = number
  default     = 1
}

variable "max_scaling_size" {
  description = "The maximum number of instances to keep in AutoScalingGroup"
  type        = number
  default     = 3
}

variable "scaling_target_capacity" {
  description = "The target capacity of AutoScalingGroup in Cluster. 0 to 100"
  type        = number
  default     = 100
}

variable "capacity_provider_strategy" {
  description = "The capacity provider strategy to use in Cluster"
  type        = map(string)
  default = {
    # weight = 60
    base = 100
  }
}

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

variable "container_port" {
  description = "The port to expose in the container"
  type        = number
}

variable "target_port" {
  description = "The target port exposed in the container"
  type        = number
}

variable "log_retention_days" {
  description = "The number of days to keep logs"
  type        = number
  default     = 7
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

variable "environment" {
  description = "The environment variables to use in Container"
  type        = list(map(string))
}

variable "secret" {
  description = "The environment variables from parameter store to use in Container"
  type        = list(map(string))
}

variable "schedule_tag" {
  description = "The tag to use to schedule start and stop of the service"
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "Additional tags to use"
  type        = map(string)
  default     = {}
}
