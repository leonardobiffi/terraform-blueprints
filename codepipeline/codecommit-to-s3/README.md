# CodePipeline | CodeCommit to S3

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.20 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.67.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_codebuild"></a> [codebuild](#module\_codebuild) | leonardobiffi/codebuild/aws | 1.1.0 |

## Resources

| Name | Type |
|------|------|
| [aws_codepipeline.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codepipeline) | resource |
| [aws_iam_policy.codebuild](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.s3_app](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.codebuild](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.codebuild_s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.s3_app](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_caller_identity.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.codebuild](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.s3_app](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app"></a> [app](#input\_app) | The name of the app | `string` | n/a | yes |
| <a name="input_build_compute_type"></a> [build\_compute\_type](#input\_build\_compute\_type) | The compute type to use | `string` | `"BUILD_GENERAL1_SMALL"` | no |
| <a name="input_build_image"></a> [build\_image](#input\_build\_image) | The name of the build image to use | `string` | `"aws/codebuild/standard:5.0"` | no |
| <a name="input_cloudfront_id"></a> [cloudfront\_id](#input\_cloudfront\_id) | The ID of the CloudFront distribution. Required if creating an invalidation stage | `string` | `null` | no |
| <a name="input_create_invalidation_stage"></a> [create\_invalidation\_stage](#input\_create\_invalidation\_stage) | Create an invalidation stage | `bool` | `false` | no |
| <a name="input_env"></a> [env](#input\_env) | The environment to set | `string` | n/a | yes |
| <a name="input_environment_build_variables"></a> [environment\_build\_variables](#input\_environment\_build\_variables) | The environment variables to use | `list(map(string))` | `[]` | no |
| <a name="input_invalidation_function_name"></a> [invalidation\_function\_name](#input\_invalidation\_function\_name) | The name of the invalidation function | `string` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | The AWS region to use | `string` | `"us-east-1"` | no |
| <a name="input_repo_branch"></a> [repo\_branch](#input\_repo\_branch) | The branch of the repository | `string` | n/a | yes |
| <a name="input_repo_name"></a> [repo\_name](#input\_repo\_name) | The name of the repository | `string` | n/a | yes |
| <a name="input_s3_bucket_artifact"></a> [s3\_bucket\_artifact](#input\_s3\_bucket\_artifact) | The S3 bucket to store the artifact | `string` | n/a | yes |
| <a name="input_s3_bucket_artifact_arn"></a> [s3\_bucket\_artifact\_arn](#input\_s3\_bucket\_artifact\_arn) | The ARN S3 bucket to store the artifact | `string` | n/a | yes |
| <a name="input_s3_bucket_frontend"></a> [s3\_bucket\_frontend](#input\_s3\_bucket\_frontend) | The S3 bucket used for the frontend | `string` | n/a | yes |
| <a name="input_s3_bucket_frontend_arn"></a> [s3\_bucket\_frontend\_arn](#input\_s3\_bucket\_frontend\_arn) | The ARN S3 bucket used for the frontend | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags to use | `map(string)` | `{}` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
