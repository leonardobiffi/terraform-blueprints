provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {}
}

data "aws_caller_identity" "default" {}

locals {
  name = "${var.env}-${var.app}"
  tags = merge(var.tags, {
    Environment = var.env
    ManagedBy   = "Terraform"
  })
}

resource "aws_codepipeline" "default" {
  name     = local.name
  role_arn = aws_iam_role.default.arn

  artifact_store {
    location = var.s3_bucket_artifact
    type     = "S3"
  }

  stage {
    name = "Source"
    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeCommit"
      version          = "1"
      output_artifacts = ["code"]

      configuration = {
        RepositoryName = var.repo_name
        BranchName     = var.repo_branch
      }
    }
  }

  stage {
    name = "Build"
    action {
      name     = "Build"
      category = "Build"
      owner    = "AWS"
      provider = "CodeBuild"
      version  = "1"

      input_artifacts  = ["code"]
      output_artifacts = ["task"]

      configuration = {
        ProjectName = module.codebuild.project_name
      }
    }
  }

  stage {
    name = "Deploy"
    action {
      name            = "Deploy"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "ECS"
      input_artifacts = ["task"]
      version         = "1"

      configuration = {
        ClusterName = local.name
        ServiceName = local.name
      }
    }
  }

  depends_on = [
    aws_iam_role_policy_attachment.default,
    aws_iam_role_policy_attachment.s3,
    aws_iam_role_policy_attachment.codebuild,
  ]

  tags = local.tags
}

# CodeBuild
module "codebuild" {
  source  = "leonardobiffi/codebuild/aws"
  version = "1.1.0"

  name = local.name

  # https://docs.aws.amazon.com/codebuild/latest/userguide/build-env-ref-available.html
  build_image        = var.build_image
  build_compute_type = var.build_compute_type
  build_timeout      = 60

  # These attributes are optional, used as ENV variables when building Docker images and pushing them to ECR
  # For more info:
  # http://docs.aws.amazon.com/codebuild/latest/userguide/sample-docker.html
  # https://www.terraform.io/docs/providers/aws/r/codebuild_project.html

  privileged_mode = true
  aws_region      = var.region
  aws_account_id  = data.aws_caller_identity.default.account_id
  image_repo_name = var.ecr_repository_name
  image_tag       = "latest"
  vpc_config      = var.vpc_config

  # Optional extra environment variables
  environment_variables = concat(
    [
      {
        name  = "CONTAINER_NAME"
        type  = "PLAINTEXT"
        value = local.name
      }
    ],
    var.environment_build_variables
  )
}

resource "aws_iam_role_policy_attachment" "codebuild_s3" {
  role       = module.codebuild.role_id
  policy_arn = aws_iam_policy.s3.arn
}

# S3 Artifact Bucket
resource "aws_s3_bucket" "artifact" {
  bucket        = "${local.name}-artifact-pipeline"
  force_destroy = true
  tags          = local.tags
}

# IAM
resource "aws_iam_role" "default" {
  name               = "${local.name}-codepipeline-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = [
      "sts:AssumeRole"
    ]

    principals {
      type        = "Service"
      identifiers = ["codepipeline.amazonaws.com"]
    }

    effect = "Allow"
  }
}

resource "aws_iam_role_policy_attachment" "default" {
  role       = aws_iam_role.default.id
  policy_arn = aws_iam_policy.default.arn
}

resource "aws_iam_policy" "default" {
  name   = "${local.name}-codepipeline-policy"
  policy = data.aws_iam_policy_document.default.json
}

data "aws_iam_policy_document" "default" {
  statement {
    actions = [
      "elasticloadbalancing:*",
      "autoscaling:*",
      "cloudwatch:*",
      "codecommit:*",
      "codebuild:*",
      "s3:*",
      "sns:*",
      "ecs:*",
      "iam:PassRole"
    ]

    resources = ["*"]
    effect    = "Allow"
  }
}

resource "aws_iam_role_policy_attachment" "s3" {
  role       = aws_iam_role.default.id
  policy_arn = aws_iam_policy.s3.arn
}

resource "aws_iam_policy" "s3" {
  name   = "${local.name}-codepipeline-s3-policy"
  policy = data.aws_iam_policy_document.s3.json
}

data "aws_iam_policy_document" "s3" {
  statement {
    actions = [
      "s3:GetObject",
      "s3:GetObjectVersion",
      "s3:GetBucketVersioning",
      "s3:PutObject"
    ]

    resources = [
      var.s3_bucket_artifact_arn,
      "${var.s3_bucket_artifact_arn}/*"
    ]

    effect = "Allow"
  }
}

resource "aws_iam_role_policy_attachment" "codebuild" {
  role       = aws_iam_role.default.id
  policy_arn = aws_iam_policy.codebuild.arn
}

resource "aws_iam_policy" "codebuild" {
  name   = "${local.name}-codepipeline-codebuild-policy"
  policy = data.aws_iam_policy_document.codebuild.json
}

data "aws_iam_policy_document" "codebuild" {
  statement {
    actions = [
      "codebuild:*"
    ]

    resources = [module.codebuild.project_id]
    effect    = "Allow"
  }
}
