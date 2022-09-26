# REQUIRED

variable "app" {
  description = "The name of the app"
  type        = string
}

variable "env" {
  description = "The environment to use"
  type        = string
}

variable "region" {
  description = "The AWS region to use"
  type        = string
}

variable "vpc_id" {
  type        = string
  description = "The VPC ID to use"
}

variable "subnets" {
  type        = list(string)
  description = "The subnets to use"
}

# OPTIONAL

variable "http_tcp_listeners" {
  type        = any
  description = "The HTTP listeners to use"
  default     = []
}

variable "https_listeners" {
  type        = any
  description = "The HTTPS listeners to use"
  default     = []
}

variable "target_groups" {
  type        = any
  description = "The target groups to use"
  default     = []
}

variable "tags" {
  description = "Additional tags to use"
  type        = map(string)
  default     = {}
}
