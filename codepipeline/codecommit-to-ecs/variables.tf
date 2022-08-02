variable "region" {
  description = "The AWS region to use"
  type        = string
  default     = "us-east-1"
}

variable "app" {
  description = "The name of the app"
  type        = string
}

variable "env" {
  description = "The environment to set"
  type        = string
}

variable "repo_name" {
  description = "The name of the repository"
  type        = string
}

variable "repo_branch" {
  description = "The branch of the repository"
  type        = string
}

variable "s3_bucket_artifact" {
  description = "The S3 bucket to store the artifact"
  type        = string
}

variable "s3_bucket_artifact_arn" {
  description = "The ARN S3 bucket to store the artifact"
  type        = string
}

variable "environment_build_variables" {
  description = "The environment variables to use in CodeBuild"
  type        = list(map(string))
}

variable "ecr_repository_name" {
  description = "The name of the ECR repository"
  type        = string
}

variable "build_image" {
  description = "The name of the build image to use"
  type        = string
  default     = "aws/codebuild/standard:5.0"
}

variable "tags" {
  description = "Additional tags to use"
  type        = map(string)
  default     = {}
}
