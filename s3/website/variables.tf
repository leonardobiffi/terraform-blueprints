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

variable "tags" {
  description = "Additional tags to use"
  type        = map(string)
  default     = {}
}
