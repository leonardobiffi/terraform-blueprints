# API Gateway | Simple

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.50 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_api_gateway"></a> [api\_gateway](#module\_api\_gateway) | terraform-aws-modules/apigateway-v2/aws | ~> 2.2 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_key_selection_expression"></a> [api\_key\_selection\_expression](#input\_api\_key\_selection\_expression) | An API key selection expression. Valid values: $context.authorizer.usageIdentifierKey, $request.header.x-api-key. | `string` | `"$request.header.x-api-key"` | no |
| <a name="input_app"></a> [app](#input\_app) | The name of the app | `string` | n/a | yes |
| <a name="input_authorizers"></a> [authorizers](#input\_authorizers) | Map of API gateway authorizers | `map(any)` | `{}` | no |
| <a name="input_cors_configuration"></a> [cors\_configuration](#input\_cors\_configuration) | The cross-origin resource sharing (CORS) configuration. Applicable for HTTP APIs. | `any` | `{}` | no |
| <a name="input_create_vpc_link"></a> [create\_vpc\_link](#input\_create\_vpc\_link) | Whether to create VPC links | `bool` | `false` | no |
| <a name="input_default_stage_access_log_destination_arn"></a> [default\_stage\_access\_log\_destination\_arn](#input\_default\_stage\_access\_log\_destination\_arn) | Default stage's ARN of the CloudWatch Logs log group to receive access logs. Any trailing :* is trimmed from the ARN. | `string` | `null` | no |
| <a name="input_default_stage_access_log_format"></a> [default\_stage\_access\_log\_format](#input\_default\_stage\_access\_log\_format) | Default stage's single line format of the access logs of data, as specified by selected $context variables. | `string` | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of the API. | `string` | `null` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | The domain name to use for API gateway | `string` | `null` | no |
| <a name="input_domain_name_certificate_arn"></a> [domain\_name\_certificate\_arn](#input\_domain\_name\_certificate\_arn) | The ARN of an AWS-managed certificate that will be used by the endpoint for the domain name | `string` | `null` | no |
| <a name="input_env"></a> [env](#input\_env) | The environment to use | `string` | n/a | yes |
| <a name="input_integrations"></a> [integrations](#input\_integrations) | Map of API gateway routes with integrations | `map(any)` | `{}` | no |
| <a name="input_protocol_type"></a> [protocol\_type](#input\_protocol\_type) | The API protocol. Valid values: HTTP, WEBSOCKET | `string` | `"HTTP"` | no |
| <a name="input_region"></a> [region](#input\_region) | The AWS region to use | `string` | `"us-east-1"` | no |
| <a name="input_route_selection_expression"></a> [route\_selection\_expression](#input\_route\_selection\_expression) | The route selection expression for the API. | `string` | `"$request.method $request.path"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | n/a |
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | n/a |
| <a name="output_id"></a> [id](#output\_id) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
