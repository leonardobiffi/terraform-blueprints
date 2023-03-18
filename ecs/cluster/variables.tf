# REQUIRED

variable "region" {
  description = "The AWS region to use"
  type        = string
}

variable "name" {
  description = "The name of the resource"
  type        = string
}

variable "env" {
  description = "The environment to use"
  type        = string
}

# OPTIONAL

variable "enabled" {
  description = "Whether to create the resources"
  type        = bool
  default     = true
}

variable "log_retention_days" {
  description = "The number of days to keep logs"
  type        = number
  default     = 7
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

variable "container_insights" {
  description = "Whether to enable container insights. Valid values are enabled or disabled."
  type        = string
  default     = "disabled"
}

# ASG Capacity Provider
variable "ec2_capacity_provider_enabled" {
  description = "Whether to enable the EC2 capacity provider"
  type        = bool
  default     = false
}

variable "asg_instance_type" {
  description = "The instance type to use in AutoScalingGroup"
  type        = string
  default     = null
}

variable "asg_min_scaling_size" {
  description = "The minimum number of instances to keep in AutoScalingGroup"
  type        = number
  default     = 1
}

variable "asg_max_scaling_size" {
  description = "The maximum number of instances to keep in AutoScalingGroup"
  type        = number
  default     = 3
}

variable "asg_scaling_target_capacity" {
  description = "The target capacity of AutoScalingGroup in Cluster. 0 to 100"
  type        = number
  default     = 100
}

variable "asg_capacity_provider_strategy" {
  description = "The capacity provider strategy to use in Cluster"
  type        = map(string)
  default = {
    base = 100
  }
}

variable "iam_role_policies" {
  description = "The additioanals IAM role policies to use in Service"
  type        = map(string)
  default     = {}
}

variable "vpc_id" {
  description = "The VPC ID to use"
  type        = string
  default     = null
}

variable "private_subnets" {
  description = "The private subnets to use"
  type        = list(string)
  default     = null
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

variable "tags" {
  description = "Additional tags to use"
  type        = map(string)
  default     = {}
}
