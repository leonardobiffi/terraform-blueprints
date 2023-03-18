data "aws_secretsmanager_secret" "main" {
  for_each = { for s in var.secrets : s.name => s }
  name     = each.key
}

locals {
  secrets = flatten([
    for s in var.secrets : [
      for k in s.keys : {
        name      = k
        valueFrom = "${data.aws_secretsmanager_secret.main[s.name].arn}:${k}::"
      }
    ]
  ])
}
