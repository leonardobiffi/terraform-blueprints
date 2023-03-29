# ECS | Service With ALB

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.20 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.59.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ecs_service"></a> [ecs\_service](#module\_ecs\_service) | leonardobiffi/ecs-service/aws | 1.5.3 |
| <a name="module_ecs_task_definition"></a> [ecs\_task\_definition](#module\_ecs\_task\_definition) | mongodb/ecs-task-definition/aws | 2.1.5 |
| <a name="module_security_group_ecs"></a> [security\_group\_ecs](#module\_security\_group\_ecs) | terraform-aws-modules/security-group/aws | ~> 4.9 |

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_ecr_lifecycle_policy.name](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_lifecycle_policy) | resource |
| [aws_ecr_repository.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |
| [aws_iam_role.ecs_tasks_execution_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.ecs_tasks_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.ecs_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy.ecs_tasks_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy_attachment.ecs_tasks_execution_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_ecs_task_definition.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ecs_task_definition) | data source |
| [aws_iam_policy_document.ecs_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.ecs_tasks_execution_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.ecs_tasks_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_secretsmanager_secret.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_autoscaling_cpu_target_value"></a> [autoscaling\_cpu\_target\_value](#input\_autoscaling\_cpu\_target\_value) | The CPU target value in Autoscaling | `number` | `0` | no |
| <a name="input_autoscaling_enabled"></a> [autoscaling\_enabled](#input\_autoscaling\_enabled) | Whether to enable autoscaling | `bool` | `false` | no |
| <a name="input_autoscaling_max_capacity"></a> [autoscaling\_max\_capacity](#input\_autoscaling\_max\_capacity) | Max Capacity in Autoscaling | `number` | `1` | no |
| <a name="input_autoscaling_memory_target_value"></a> [autoscaling\_memory\_target\_value](#input\_autoscaling\_memory\_target\_value) | The memory target value in Autoscaling | `number` | `0` | no |
| <a name="input_autoscaling_min_capacity"></a> [autoscaling\_min\_capacity](#input\_autoscaling\_min\_capacity) | Min Capacity in Autoscaling | `number` | `1` | no |
| <a name="input_cluster_id"></a> [cluster\_id](#input\_cluster\_id) | The ECS cluster ID to use | `string` | n/a | yes |
| <a name="input_container_port"></a> [container\_port](#input\_container\_port) | The port to expose in the container | `number` | n/a | yes |
| <a name="input_cpu"></a> [cpu](#input\_cpu) | The amount of CPU to use in task | `number` | `256` | no |
| <a name="input_desired_count"></a> [desired\_count](#input\_desired\_count) | The desired count of the service | `number` | `1` | no |
| <a name="input_enable_execute_command"></a> [enable\_execute\_command](#input\_enable\_execute\_command) | Whether to enable execute command. Valid values are true or false. | `bool` | `true` | no |
| <a name="input_env"></a> [env](#input\_env) | The environment to use | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment variables to use in Container | `list(map(string))` | `[]` | no |
| <a name="input_health_check_grace_period_seconds"></a> [health\_check\_grace\_period\_seconds](#input\_health\_check\_grace\_period\_seconds) | The health check grace period seconds to use in Service | `number` | `0` | no |
| <a name="input_ingress_cidr_blocks"></a> [ingress\_cidr\_blocks](#input\_ingress\_cidr\_blocks) | The ingress cidr blocks to use in Service | `list(string)` | `[]` | no |
| <a name="input_ingress_rules"></a> [ingress\_rules](#input\_ingress\_rules) | The ingress rules to use in Service | `list(string)` | `[]` | no |
| <a name="input_ingress_with_source_security_group_id"></a> [ingress\_with\_source\_security\_group\_id](#input\_ingress\_with\_source\_security\_group\_id) | The ingress with source security group id to use in Service | `list(map(string))` | `[]` | no |
| <a name="input_launch_type"></a> [launch\_type](#input\_launch\_type) | The launch type to use for the service ("EC2" or "FARGATE"). | `string` | `null` | no |
| <a name="input_log_retention_days"></a> [log\_retention\_days](#input\_log\_retention\_days) | The number of days to keep logs | `number` | `7` | no |
| <a name="input_max_image_count"></a> [max\_image\_count](#input\_max\_image\_count) | The maximum number of images to keep in ECR | `number` | `10` | no |
| <a name="input_memory"></a> [memory](#input\_memory) | The amount of memory to use in task | `number` | `512` | no |
| <a name="input_multiples_target_groups"></a> [multiples\_target\_groups](#input\_multiples\_target\_groups) | The multiples target groups to attach to the service. | <pre>list(object({<br>    target_group_arn = string<br>    container_name   = string<br>    container_port   = string<br>  }))</pre> | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the service | `string` | n/a | yes |
| <a name="input_parameters"></a> [parameters](#input\_parameters) | List of parameters to use in Container | <pre>list(object({<br>    name      = string<br>    valueFrom = string<br>  }))</pre> | `[]` | no |
| <a name="input_parameters_by_path"></a> [parameters\_by\_path](#input\_parameters\_by\_path) | The Path to use in parameters | <pre>list(object({<br>    name = string<br>    keys = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_platform_version"></a> [platform\_version](#input\_platform\_version) | The platform version to use for the ECS | `string` | `"1.4.0"` | no |
| <a name="input_policy_statement"></a> [policy\_statement](#input\_policy\_statement) | The policy statements to use in Task Role | <pre>list(object({<br>    sid       = optional(string)<br>    effect    = string<br>    actions   = list(string)<br>    resources = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | The private subnets to use | `list(string)` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The AWS region to use | `string` | n/a | yes |
| <a name="input_scale_in_cooldown"></a> [scale\_in\_cooldown](#input\_scale\_in\_cooldown) | The scale in cooldown in Autoscaling | `number` | `120` | no |
| <a name="input_scale_out_cooldown"></a> [scale\_out\_cooldown](#input\_scale\_out\_cooldown) | The scale out cooldown in Autoscaling | `number` | `120` | no |
| <a name="input_schedule_tag"></a> [schedule\_tag](#input\_schedule\_tag) | The tag to use to schedule start and stop of the service | `map(string)` | `{}` | no |
| <a name="input_secrets"></a> [secrets](#input\_secrets) | List of secrets to fetch from AWS Secrets Manager and use in Container | <pre>list(object({<br>    name = string<br>    keys = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags to use | `map(string)` | `{}` | no |
| <a name="input_target_group_arn"></a> [target\_group\_arn](#input\_target\_group\_arn) | The arn of the target group to point at the service containers. | `string` | n/a | yes |
| <a name="input_target_port"></a> [target\_port](#input\_target\_port) | The target port exposed in the container | `number` | n/a | yes |
| <a name="input_task_network_mode"></a> [task\_network\_mode](#input\_task\_network\_mode) | The network mode used for the containers in the task. | `string` | `"awsvpc"` | no |
| <a name="input_task_role_arn"></a> [task\_role\_arn](#input\_task\_role\_arn) | The short name or full Amazon Resource Name (ARN) of the IAM role that containers in this task can assume | `string` | `null` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The VPC ID to use | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ecr_repository_arn"></a> [ecr\_repository\_arn](#output\_ecr\_repository\_arn) | The ARN of the ECR repository |
| <a name="output_ecr_repository_name"></a> [ecr\_repository\_name](#output\_ecr\_repository\_name) | The name of the ECR repository |
| <a name="output_ecr_repository_url"></a> [ecr\_repository\_url](#output\_ecr\_repository\_url) | The name of the ECR repository |
| <a name="output_ecs_service_id"></a> [ecs\_service\_id](#output\_ecs\_service\_id) | The ARN of the ECS service |
| <a name="output_ecs_tasks_execution_role_arn"></a> [ecs\_tasks\_execution\_role\_arn](#output\_ecs\_tasks\_execution\_role\_arn) | The ARN of the ECS tasks execution role |
| <a name="output_ecs_tasks_role_arn"></a> [ecs\_tasks\_role\_arn](#output\_ecs\_tasks\_role\_arn) | The ARN of the ECS tasks role |
| <a name="output_security_group_ids"></a> [security\_group\_ids](#output\_security\_group\_ids) | The IDs of the security groups |
| <a name="output_subnet_ids"></a> [subnet\_ids](#output\_subnet\_ids) | The IDs of the subnets |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The ID of the VPC |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
