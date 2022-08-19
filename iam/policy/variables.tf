# Required

variable "app" {
  description = "The name of the app"
  type        = string
}

variable "env" {
  description = "The environment to use"
  type        = string
}

variable "policy_statements" {
  description = "Policy Statements"
  type        = any
}

# Optional

variable "tags" {
  description = "Additional tags to use"
  type        = map(string)
  default     = {}
}
