# REQUIRED

variable "app" {
  description = "The name of the app"
  type        = string
}

variable "env" {
  description = "The environment to use"
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

variable "region" {
  description = "The AWS region to use"
  type        = string
  default     = "us-east-1"
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

variable "secret" {
  description = "The environment variables from parameter store to use in Container"
  type        = list(map(string))
  default     = []
}

variable "fargate_capacity_weight" {
  description = "The weight of the Fargate capacity provider strategy"
  type        = number
  default     = 1
}

variable "fargate_capacity_base" {
  description = "The base of the Fargate capacity provider strategy"
  type        = number
  default     = 1
}

variable "fargate_spot_capacity_weight" {
  description = "The weight of the Fargate spot capacity provider strategy"
  type        = number
  default     = null
}

variable "fargate_spot_capacity_base" {
  description = "The base of the Fargate spot capacity provider strategy"
  type        = number
  default     = null
}

variable "ingress_cidr_blocks" {
  description = "The ingress cidr blocks to use in Service"
  type        = list(string)
  default     = []
}

variable "source_security_group_ids" {
  description = "The source security group IDs to use in Service"
  type        = list(string)
  default     = []
}

variable "task_role_arn" {
  description = "The short name or full Amazon Resource Name (ARN) of the IAM role that containers in this task can assume"
  type        = string
  default     = null
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
