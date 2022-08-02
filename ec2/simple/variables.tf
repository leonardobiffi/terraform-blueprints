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

variable "ami" {
  type        = string
  description = "The AMI to use"
}

variable "instance_type" {
  type        = string
  description = "The instance type to use"
}

variable "key_name" {
  type        = string
  description = "The key name to use"
}

variable "security_group_ids" {
  type        = list(string)
  description = "The security group IDs to use"
  default     = []
}

variable "subnet_id" {
  type        = string
  description = "The subnet ID to use"
}

variable "vpc_id" {
  type        = string
  description = "The VPC ID to use"
}

variable "user_data" {
  type        = string
  description = "The user data to use"
  default     = null
}

variable "associate_public_ip_address" {
  type        = bool
  description = "Whether to associate a public IP address"
  default     = true
}

variable "root_volume_type" {
  type        = string
  description = "The root volume type to use"
  default     = "gp3"
}

variable "root_volume_size" {
  type        = number
  description = "The root volume size to use"
  default     = 10
}

variable "policy_statement" {
  description = "Statement for the IAM policy"
  type        = any
  default = [
    {
      sid    = "S3ListBucket"
      effect = "Allow"
      actions = [
        "s3:ListBucket",
      ]
      resources = ["arn:aws:s3:::*"]
    }
  ]
}

variable "ingress_cidr_blocks" {
  description = "The RDS ingress CIDR blocks to use"
  type        = list(string)
  default     = []
}

variable "ingress_with_cidr_blocks" {
  description = "The RDS ingress With CIDR blocks to use"
  type        = list(map(string))
  default     = []
}

variable "ingress_rules" {
  description = "The RDS ingress rules to use"
  type        = list(string)
  default     = []
}

variable "egress_rules" {
  description = "The RDS egress rules to use"
  type        = list(string)
  default     = []
}

variable "tags" {
  type        = map(string)
  description = "Additional tags"
  default     = {}
}
