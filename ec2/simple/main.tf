provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {}
}

locals {
  name               = "${var.env}-${var.app}"
  security_group_ids = length(var.security_group_ids) > 0 ? concat(var.security_group_ids, [module.security_group.security_group_id]) : [module.security_group.security_group_id]

  tags = merge(
    {
      Environment = var.env
      ManagedBy   = "Terraform"
    },
    var.tags
  )
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 4.0"

  name                        = local.name
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  vpc_security_group_ids      = local.security_group_ids
  subnet_id                   = var.subnet_id
  user_data                   = var.user_data
  associate_public_ip_address = var.associate_public_ip_address
  iam_instance_profile        = module.ec2_iam_role.profile_name
  disable_api_termination     = true

  enable_volume_tags = true
  root_block_device = [
    {
      encrypted   = true
      volume_type = var.root_volume_type
      volume_size = var.root_volume_size
    },
  ]

  tags = local.tags
}

resource "aws_eip" "lb" {
  instance = module.ec2_instance.id
  vpc      = true
  tags     = merge(local.tags, { Name = local.name })

  depends_on = [
    module.ec2_instance
  ]
}

module "ec2_iam_role" {
  source  = "leonardobiffi/ec2-iam-role/aws"
  version = "0.1.0"

  name = local.name

  policy_arn = [
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
    module.iam_policy.arn,
  ]

  tags = local.tags

  depend_on = module.iam_policy
}

module "iam_policy" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "5.2.0"

  name        = local.name
  path        = "/"
  description = "Policy for ${var.app}"
  policy      = data.aws_iam_policy_document.policy.json

  tags = local.tags
}

data "aws_iam_policy_document" "policy" {
  dynamic "statement" {
    for_each = var.policy_statement
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
