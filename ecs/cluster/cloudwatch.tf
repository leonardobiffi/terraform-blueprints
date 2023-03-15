locals {
  cloudwatch_log_group_name = var.enabled ? aws_cloudwatch_log_group.main[0].name : null
}

resource "aws_cloudwatch_log_group" "main" {
  count = var.enabled ? 1 : 0

  name              = "/aws/ecs/${local.name}"
  retention_in_days = var.log_retention_days
  tags              = local.tags
}
