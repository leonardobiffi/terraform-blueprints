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
  default     = []
}

# Optional

variable "trusted_role_arns" {
  description = "Trusted Role ARNs"
  type        = any
  default     = []
}

variable "trusted_role_services" {
  description = "Trusted Role Services"
  type        = any
  default     = []
}

variable "custom_policy_arns" {
  description = "Custom Policy ARNs"
  type        = any
  default     = []
}

variable "tags" {
  description = "Additional tags to use"
  type        = map(string)
  default     = {}
}
