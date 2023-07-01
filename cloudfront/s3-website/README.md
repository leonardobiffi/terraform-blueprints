# Cloudfront | S3 WebSite

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
| <a name="module_cloudfront"></a> [cloudfront](#module\_cloudfront) | terraform-aws-modules/cloudfront/aws | 2.9.3 |

## Resources

| Name | Type |
|------|------|
| [aws_s3_bucket_policy.bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_iam_policy_document.s3_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acm_certificate_arn"></a> [acm\_certificate\_arn](#input\_acm\_certificate\_arn) | The ARN of the ACM certificate | `string` | `null` | no |
| <a name="input_app"></a> [app](#input\_app) | The name of the app | `string` | n/a | yes |
| <a name="input_create_origin_access_identity"></a> [create\_origin\_access\_identity](#input\_create\_origin\_access\_identity) | Whether to create an origin access identity | `bool` | `false` | no |
| <a name="input_custom_error_response"></a> [custom\_error\_response](#input\_custom\_error\_response) | One or more custom error response elements | `any` | `{}` | no |
| <a name="input_default_cache_behavior"></a> [default\_cache\_behavior](#input\_default\_cache\_behavior) | The default cache behavior to use in the CloudFront distribution | `any` | n/a | yes |
| <a name="input_default_root_object"></a> [default\_root\_object](#input\_default\_root\_object) | The default root object to use | `string` | `"index.html"` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | The domain name to use | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | The environment to use | `string` | n/a | yes |
| <a name="input_ordered_cache_behavior"></a> [ordered\_cache\_behavior](#input\_ordered\_cache\_behavior) | The ordered cache behavior to use in the CloudFront distribution | `list(any)` | `[]` | no |
| <a name="input_origin"></a> [origin](#input\_origin) | The origin to use in the CloudFront distribution | `any` | n/a | yes |
| <a name="input_origin_access_identities"></a> [origin\_access\_identities](#input\_origin\_access\_identities) | The origin access identities to use | `map(string)` | `{}` | no |
| <a name="input_region"></a> [region](#input\_region) | The AWS region to use | `string` | `"us-east-1"` | no |
| <a name="input_s3_bucket_arn"></a> [s3\_bucket\_arn](#input\_s3\_bucket\_arn) | The ARN of the S3 bucket to use | `string` | `""` | no |
| <a name="input_s3_bucket_id"></a> [s3\_bucket\_id](#input\_s3\_bucket\_id) | The ID of the S3 bucket to use | `string` | `""` | no |
| <a name="input_subdomain"></a> [subdomain](#input\_subdomain) | The subdomain to use | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags to use | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudfront_domain"></a> [cloudfront\_domain](#output\_cloudfront\_domain) | The CloudFront domain name |
| <a name="output_cloudfront_id"></a> [cloudfront\_id](#output\_cloudfront\_id) | The CloudFront ID |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
