# Required

variable "app" {
  type        = string
  description = "The name of the app"
}

variable "env" {
  type        = string
  description = "The environment to use"
}

# Optional

variable "region" {
  type        = string
  description = "The AWS region to use"
  default     = "us-east-1"
}

variable "policy" {
  type        = string
  description = "The policy to apply to the bucket"
  default     = null
}

variable "force_destroy" {
  type        = bool
  description = "Whether to force destroy"
  default     = false
}

variable "lifecycle_rule" {
  description = "The lifecycle rule to use"
  type        = list(any)
  default     = []
}

variable "block_public_acls" {
  type        = bool
  description = "Whether to block public acls"
  default     = true
}

variable "block_public_policy" {
  type        = bool
  description = "Whether to block public policy"
  default     = true
}

variable "ignore_public_acls" {
  type        = bool
  description = "Whether to ignore public acls"
  default     = true
}

variable "restrict_public_buckets" {
  type        = bool
  description = "Whether to restrict public buckets"
  default     = true
}

variable "tags" {
  description = "Additional tags to use"
  type        = map(string)
  default     = {}
}
