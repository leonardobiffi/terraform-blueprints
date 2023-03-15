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

variable "tags" {
  description = "Additional tags to use"
  type        = map(string)
  default     = {}
}
