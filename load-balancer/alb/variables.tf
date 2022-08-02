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

variable "target_groups" {
  type        = any
  description = "The target groups to use"
}

variable "http_tcp_listeners" {
  type        = any
  description = "The HTTP listeners to use"
  default     = []
}

variable "https_listeners" {
  type        = any
  description = "The HTTP listeners to use"
  default     = []
}

variable "http_tcp_listener_rules" {
  type        = any
  description = "The HTTP listener rules to use"
  default     = []
}

variable "https_listener_rules" {
  type        = any
  description = "The HTTPS listener rules to use"
  default     = []
}

variable "vpc_id" {
  type        = string
  description = "The VPC ID to use"
}

variable "subnets" {
  type        = list(string)
  description = "The subnets to use"
}

variable "tags" {
  description = "Additional tags to use"
  type        = map(string)
  default     = {}
}
