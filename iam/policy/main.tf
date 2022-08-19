provider "aws" {}

terraform {
  backend "s3" {}
}

locals {
  name = "${var.env}-${var.app}"

  tags = merge(
    {
      Environment = var.env
      ManagedBy   = "Terraform"
    },
    var.tags
  )
}

# Policy
data "aws_iam_policy_document" "policy" {
  dynamic "statement" {
    for_each = var.policy_statements
    content {
      sid       = statement.value.sid
      effect    = statement.value.effect
      actions   = statement.value.actions
      resources = statement.value.resources

      dynamic "condition" {
        for_each = lookup(statement.value, "conditions", [])
        content {
          test     = condition.value.test
          variable = condition.value.variable
          values   = condition.value.values
        }
      }
    }
  }
}

module "policy" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "5.3.0"

  name   = local.name
  path   = "/"
  policy = data.aws_iam_policy_document.policy.json

  tags = local.tags
}
