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

variable "engine" {
  description = "The RDS engine to use"
  type        = string
  default     = "mysql"
}

variable "engine_version" {
  description = "The RDS engine version to use"
  type        = string
}

variable "instance_class" {
  description = "The RDS instance class to use"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "The RDS allocated storage to use"
  type        = number
}

variable "max_allocated_storage" {
  description = "The RDS max allocated storage to use"
  type        = number
}

variable "db_name" {
  description = "The RDS database name to use"
  type        = string
}

variable "username" {
  description = "The RDS username to use"
  type        = string
}

variable "port" {
  description = "The RDS port to use"
  type        = string
  default     = "3306"
}

variable "subnet_ids" {
  description = "The RDS subnet IDs to use"
  type        = list(string)
}

variable "vpc_id" {
  description = "The VPC ID to use"
  type        = string
}

variable "ingress_cidr_blocks" {
  description = "The RDS ingress CIDR blocks to use"
  type        = list(string)
}

variable "ingress_rules" {
  description = "The RDS ingress rules to use"
  type        = list(string)
}

variable "egress_rules" {
  description = "The RDS egress rules to use"
  type        = list(string)
}

variable "family" {
  description = "The RDS parameter group family to use"
  type        = string
}

variable "major_engine_version" {
  description = "The RDS parameter group major engine version to use"
  type        = string
}

variable "deletion_protection" {
  description = "The RDS parameter group deletion protection to use"
  type        = bool
  default     = false
}

variable "parameters" {
  description = "The RDS parameter group parameters to use"
  type        = list(any)
  default     = []
}

variable "option_group_name" {
  description = "The RDS option group name to use"
  type        = string
  default     = null
}

variable "apply_immediately" {
  description = "The RDS parameter group apply immediately to use"
  type        = bool
  default     = false
}

variable "skip_final_snapshot" {
  description = "The RDS parameter group skip final snapshot to use"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Additional tags to use"
  type        = map(string)
  default     = {}
}
