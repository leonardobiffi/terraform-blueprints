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

variable "private_subnets" {
  description = "The private subnets to use"
  type        = list(string)
}

variable "cluster_id" {
  description = "The ID of the ECS cluster. If not provided, a new cluster will be created"
  type        = string
}

# OPTIONAL

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

variable "parameters_by_path" {
  description = "The Path to use in parameters"
  type = list(object({
    name = string
    keys = list(string)
  }))
  default = []
}

variable "task_role_arn" {
  description = "The short name or full Amazon Resource Name (ARN) of the IAM role that containers in this task can assume"
  type        = string
  default     = null
}

variable "ecr_repository_url" {
  description = "The URL of the ECR repository"
  type        = string
  default     = null
}

variable "container_insights" {
  description = "Whether to enable container insights. Valid values are enabled or disabled."
  type        = string
  default     = "disabled"
}

variable "enable_execute_command" {
  description = "Whether to enable execute command. Valid values are true or false."
  type        = bool
  default     = true
}

variable "launch_type" {
  description = "The launch type to use for the service (\"EC2\" or \"FARGATE\")."
  type        = string
  default     = null
}

variable "platform_version" {
  description = "The platform version to use for the ECS"
  type        = string
  default     = "1.4.0"
}

variable "task_network_mode" {
  description = "The network mode used for the containers in the task."
  type        = string
  default     = "awsvpc"
}

variable "command" {
  description = "The command that is passed to the container"
  type        = list(string)
  default     = []
}

variable "healthCheck" {
  description = "The health check command and interval"
  type = object({
    command     = optional(list(string))
    interval    = optional(number)
    timeout     = optional(number)
    retries     = optional(number)
    startPeriod = optional(number)
  })
  default = {}
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
