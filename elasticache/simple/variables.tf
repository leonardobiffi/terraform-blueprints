# Required
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

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "cluster_size" {
  description = "Number of nodes in cluster. *Ignored when `cluster_mode_enabled` == `true`*"
  type        = number
}

variable "subnets" {
  description = "Subnet IDs"
  type        = list(string)
}

variable "instance_type" {
  description = "Elastic cache instance type"
  type        = string
}

variable "family" {
  description = "Redis family"
  type        = string
}

variable "engine_version" {
  description = "Redis engine version"
  type        = string
}

# Optional
variable "allowed_security_group_ids" {
  description = "List of security group IDs allowed to connect to the cache"
  type        = list(string)
  default     = []
}

variable "maintenance_window" {
  description = "Maintenance window"
  type        = string
  default     = "wed:03:00-wed:04:00"
}

variable "port" {
  description = "Redis port"
  type        = number
  default     = 6379
}

variable "parameter" {
  description = "A list of Redis parameters to apply. Note that parameters may differ from one Redis family to another"
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "at_rest_encryption_enabled" {
  description = "Enable encryption at rest"
  type        = bool
  default     = false
}

variable "transit_encryption_enabled" {
  description = <<-EOT
    Set `true` to enable encryption in transit. Forced `true` if `var.auth_token` is set.
    If this is enabled, use the [following guide](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/in-transit-encryption.html#connect-tls) to access redis.
    EOT
  type        = bool
  default     = true
}

variable "apply_immediately" {
  description = "Apply changes immediately"
  type        = bool
  default     = true
}

variable "automatic_failover_enabled" {
  description = "Automatic failover (Not available for T1/T2 instances)"
  type        = bool
  default     = false
}

variable "multi_az_enabled" {
  description = "Multi AZ (Automatic Failover must also be enabled.  If Cluster Mode is enabled, Multi AZ is on by default, and this setting is ignored)"
  type        = bool
  default     = false
}

variable "availability_zones" {
  description = "Availability zone IDs"
  type        = list(string)
  default     = []
}

variable "auth_token" {
  description = "Auth token for password protecting redis, `transit_encryption_enabled` must be set to `true`. Password must be longer than 16 chars"
  type        = string
  default     = null
}

variable "kms_key_id" {
  description = "The ARN of the key that you wish to use if encrypting at rest. If not supplied, uses service managed encryption. `at_rest_encryption_enabled` must be set to `true`"
  type        = string
  default     = null
}

variable "replication_group_id" {
  description = "Replication group ID with the following constraints: \nA name must contain from 1 to 20 alphanumeric characters or hyphens. \n The first character must be a letter. \n A name cannot end with a hyphen or contain two consecutive hyphens."
  type        = string
  default     = ""
}

variable "snapshot_arns" {
  description = "A single-element string list containing an Amazon Resource Name (ARN) of a Redis RDB snapshot file stored in Amazon S3. Example: arn:aws:s3:::my_bucket/snapshot1.rdb"
  type        = list(string)
  default     = []
}

variable "snapshot_name" {
  description = "The name of a snapshot from which to restore data into the new node group. Changing the snapshot_name forces a new resource."
  type        = string
  default     = null
}

variable "snapshot_window" {
  description = "The daily time range (in UTC) during which ElastiCache will begin taking a daily snapshot of your cache cluster."
  type        = string
  default     = "06:30-07:30"
}

variable "snapshot_retention_limit" {
  description = "The number of days for which ElastiCache will retain automatic cache cluster snapshots before deleting them."
  type        = number
  default     = 0
}

variable "final_snapshot_identifier" {
  description = "The name of your final node group (shard) snapshot. ElastiCache creates the snapshot from the primary node in the cluster. If omitted, no final snapshot will be made."
  type        = string
  default     = null
}

variable "cluster_mode_enabled" {
  description = "Flag to enable/disable creation of a native redis cluster. `automatic_failover_enabled` must be set to `true`. Only 1 `cluster_mode` block is allowed"
  type        = bool
  default     = false
}

variable "cluster_mode_replicas_per_node_group" {
  description = "Number of replica nodes in each node group. Valid values are 0 to 5. Changing this number will force a new resource"
  type        = number
  default     = 0
}

variable "cluster_mode_num_node_groups" {
  description = "Number of node groups (shards) for this Redis replication group. Changing this number will trigger an online resizing operation before other settings modifications"
  type        = number
  default     = 0
}

variable "description" {
  description = "Description of elasticache replication group"
  type        = string
  default     = null
}

variable "auto_minor_version_upgrade" {
  description = "Specifies whether minor version engine upgrades will be applied automatically to the underlying Cache Cluster instances during the maintenance window. Only supported if the engine version is 6 or higher."
  type        = bool
  default     = null
}

variable "allowed_cidr_blocks" {
  description = "Additional CIDR blocks to allow access to the cache"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
