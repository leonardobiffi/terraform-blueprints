variable "region" {
  type        = string
  description = "The AWS region to use"
  default     = "us-east-1"
}

variable "app" {
  type        = string
  description = "The name of the app"
}

variable "env" {
  type        = string
  description = "The environment to use"
}

variable "force_destroy" {
  type        = bool
  description = "Whether to force destroy"
  default     = false
}

variable "lifecycle_rule" {
  description = "The lifecycle rule to use"
  type        = list(any)
}

variable "tags" {
  description = "Additional tags to use"
  type        = map(string)
  default     = {}
}
