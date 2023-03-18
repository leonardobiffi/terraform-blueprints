resource "aws_cloudwatch_log_group" "this" {
  name              = "/aws/ecs/${local.name}"
  retention_in_days = var.log_retention_days
  tags              = local.tags
}
