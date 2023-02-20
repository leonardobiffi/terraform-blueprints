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

# Resource
variable "protocol_type" {
  description = "The API protocol. Valid values: HTTP, WEBSOCKET"
  type        = string
  default     = "HTTP"
}

variable "create_vpc_link" {
  description = "Whether to create VPC links"
  type        = bool
  default     = false
}

variable "description" {
  description = "The description of the API."
  type        = string
  default     = null
}

variable "api_key_selection_expression" {
  description = "An API key selection expression. Valid values: $context.authorizer.usageIdentifierKey, $request.header.x-api-key."
  type        = string
  default     = "$request.header.x-api-key"
}

variable "route_selection_expression" {
  description = "The route selection expression for the API."
  type        = string
  default     = "$request.method $request.path"
}

variable "cors_configuration" {
  description = "The cross-origin resource sharing (CORS) configuration. Applicable for HTTP APIs."
  type        = any
  default     = {}
}

variable "default_stage_access_log_destination_arn" {
  description = "Default stage's ARN of the CloudWatch Logs log group to receive access logs. Any trailing :* is trimmed from the ARN."
  type        = string
  default     = null
}

variable "default_stage_access_log_format" {
  description = "Default stage's single line format of the access logs of data, as specified by selected $context variables."
  type        = string
  default     = null
}

variable "domain_name" {
  description = "The domain name to use for API gateway"
  type        = string
  default     = null
}

variable "domain_name_certificate_arn" {
  description = "The ARN of an AWS-managed certificate that will be used by the endpoint for the domain name"
  type        = string
  default     = null
}

variable "integrations" {
  description = "Map of API gateway routes with integrations"
  type        = map(any)
  default     = {}
}

variable "authorizers" {
  description = "Map of API gateway authorizers"
  type        = map(any)
  default     = {}
}

variable "tags" {
  type        = map(string)
  description = "Additional tags"
  default     = {}
}
