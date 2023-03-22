locals {
  create_ecr         = var.ecr_repository_url == null ? true : false
  ecr_repository_url = var.ecr_repository_url == null ? aws_ecr_repository.this[0].repository_url : var.ecr_repository_url
}

resource "aws_ecr_repository" "this" {
  count = local.create_ecr ? 1 : 0

  name                 = local.name
  image_tag_mutability = "MUTABLE"
  force_delete         = true

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = local.tags
}

locals {
  untagged_image_rule = [{
    rulePriority = 1
    description  = "Remove untagged images"
    selection = {
      tagStatus   = "untagged"
      countType   = "sinceImagePushed"
      countUnit   = "days"
      countNumber = 1
    }
    action = {
      type = "expire"
    }
  }]

  remove_old_image_rule = [{
    rulePriority = 2
    description  = "Rotate images when reach ${var.max_image_count} images stored",
    selection = {
      tagStatus   = "any"
      countType   = "imageCountMoreThan"
      countNumber = var.max_image_count
    }
    action = {
      type = "expire"
    }
  }]
}

resource "aws_ecr_lifecycle_policy" "name" {
  count = local.create_ecr ? 1 : 0

  repository = aws_ecr_repository.this[0].name

  policy = jsonencode({
    rules = concat(local.untagged_image_rule, local.remove_old_image_rule)
  })
}
