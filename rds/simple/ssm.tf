module "store_write" {
  source  = "cloudposse/ssm-parameter-store/aws"
  version = "0.10.0"

  parameter_write = [
    {
      name        = "/${var.app}/${var.env}/database/username"
      value       = var.username
      type        = "String"
      overwrite   = "true"
      description = "Database Username"
    },
    {
      name        = "/${var.app}/${var.env}/database/password"
      value       = module.rds.db_instance_password
      type        = "SecureString"
      overwrite   = "true"
      description = "Database Password"
    },
    {
      name        = "/${var.app}/${var.env}/database/url"
      value       = module.rds.db_instance_address
      type        = "String"
      overwrite   = "true"
      description = "Database URL"
    }
  ]

  tags = local.tags
}
