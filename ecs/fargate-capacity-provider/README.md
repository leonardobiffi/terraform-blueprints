# ECS | Fargate Capacity Provider

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
| <a name="module_ecs_cluster"></a> [ecs\_cluster](#module\_ecs\_cluster) | terraform-aws-modules/ecs/aws | ~> 4.0 |
| <a name="module_ecs_service"></a> [ecs\_service](#module\_ecs\_service) | leonardobiffi/ecs-service/aws | 1.5.3 |
| <a name="module_ecs_task_definition"></a> [ecs\_task\_definition](#module\_ecs\_task\_definition) | git@github.com:mongodb/terraform-aws-ecs-task-definition.git | master |
| <a name="module_security_group_ecs"></a> [security\_group\_ecs](#module\_security\_group\_ecs) | terraform-aws-modules/security-group/aws | ~> 4.9 |

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_ecr_lifecycle_policy.name](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_lifecycle_policy) | resource |
| [aws_ecr_repository.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |
| [aws_iam_role.ecs_tasks_execution_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.ecs_tasks_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.ecs_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy.ecs_tasks_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy_attachment.ecs_tasks_execution_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_ecs_task_definition.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ecs_task_definition) | data source |
| [aws_iam_policy_document.ecs_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.ecs_tasks_execution_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.ecs_tasks_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_attach_to_load_balancer"></a> [attach\_to\_load\_balancer](#input\_attach\_to\_load\_balancer) | Whether or not this service should attach to a load balancer. | `bool` | `true` | no |
| <a name="input_attach_to_multiples_target_groups"></a> [attach\_to\_multiples\_target\_groups](#input\_attach\_to\_multiples\_target\_groups) | Whether or not this service should attach to multiples target groups. | `bool` | `false` | no |
| <a name="input_autoscaling_cpu_target_value"></a> [autoscaling\_cpu\_target\_value](#input\_autoscaling\_cpu\_target\_value) | The CPU target value in Autoscaling | `number` | `0` | no |
| <a name="input_autoscaling_enabled"></a> [autoscaling\_enabled](#input\_autoscaling\_enabled) | Whether to enable autoscaling | `bool` | `false` | no |
| <a name="input_autoscaling_max_capacity"></a> [autoscaling\_max\_capacity](#input\_autoscaling\_max\_capacity) | Max Capacity in Autoscaling | `number` | `1` | no |
| <a name="input_autoscaling_memory_target_value"></a> [autoscaling\_memory\_target\_value](#input\_autoscaling\_memory\_target\_value) | The memory target value in Autoscaling | `number` | `0` | no |
| <a name="input_autoscaling_min_capacity"></a> [autoscaling\_min\_capacity](#input\_autoscaling\_min\_capacity) | Min Capacity in Autoscaling | `number` | `1` | no |
| <a name="input_container_insights"></a> [container\_insights](#input\_container\_insights) | Whether to enable container insights. Valid values are enabled or disabled. | `string` | `"disabled"` | no |
| <a name="input_container_port"></a> [container\_port](#input\_container\_port) | The port to expose in the container | `number` | n/a | yes |
| <a name="input_cpu"></a> [cpu](#input\_cpu) | The amount of CPU to use in task | `number` | `256` | no |
| <a name="input_desired_count"></a> [desired\_count](#input\_desired\_count) | The desired count of the service | `number` | `1` | no |
| <a name="input_enable_execute_command"></a> [enable\_execute\_command](#input\_enable\_execute\_command) | Whether to enable execute command. Valid values are true or false. | `bool` | `true` | no |
| <a name="input_env"></a> [env](#input\_env) | The environment to use | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment variables to use in Container | `list(map(string))` | `[]` | no |
| <a name="input_fargate_capacity_base"></a> [fargate\_capacity\_base](#input\_fargate\_capacity\_base) | The base of the Fargate capacity provider strategy | `number` | `1` | no |
| <a name="input_fargate_capacity_weight"></a> [fargate\_capacity\_weight](#input\_fargate\_capacity\_weight) | The weight of the Fargate capacity provider strategy | `number` | `1` | no |
| <a name="input_fargate_spot_capacity_base"></a> [fargate\_spot\_capacity\_base](#input\_fargate\_spot\_capacity\_base) | The base of the Fargate spot capacity provider strategy | `number` | `null` | no |
| <a name="input_fargate_spot_capacity_weight"></a> [fargate\_spot\_capacity\_weight](#input\_fargate\_spot\_capacity\_weight) | The weight of the Fargate spot capacity provider strategy | `number` | `null` | no |
| <a name="input_health_check_grace_period_seconds"></a> [health\_check\_grace\_period\_seconds](#input\_health\_check\_grace\_period\_seconds) | The health check grace period seconds to use in Service | `number` | `0` | no |
| <a name="input_ingress_cidr_blocks"></a> [ingress\_cidr\_blocks](#input\_ingress\_cidr\_blocks) | The ingress cidr blocks to use in Service | `list(string)` | `[]` | no |
| <a name="input_log_retention_days"></a> [log\_retention\_days](#input\_log\_retention\_days) | The number of days to keep logs | `number` | `7` | no |
| <a name="input_max_image_count"></a> [max\_image\_count](#input\_max\_image\_count) | The maximum number of images to keep in ECR | `number` | `10` | no |
| <a name="input_memory"></a> [memory](#input\_memory) | The amount of memory to use in task | `number` | `512` | no |
| <a name="input_multiples_target_groups"></a> [multiples\_target\_groups](#input\_multiples\_target\_groups) | The multiples target groups to attach to the service. | <pre>list(object({<br>    target_group_arn = string<br>    container_name   = string<br>    container_port   = string<br>  }))</pre> | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the app | `string` | n/a | yes |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | The private subnets to use | `list(string)` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The AWS region to use | `string` | `"us-east-1"` | no |
| <a name="input_scale_in_cooldown"></a> [scale\_in\_cooldown](#input\_scale\_in\_cooldown) | The scale in cooldown in Autoscaling | `number` | `120` | no |
| <a name="input_scale_out_cooldown"></a> [scale\_out\_cooldown](#input\_scale\_out\_cooldown) | The scale out cooldown in Autoscaling | `number` | `120` | no |
| <a name="input_schedule_tag"></a> [schedule\_tag](#input\_schedule\_tag) | The tag to use to schedule start and stop of the service | `map(string)` | `{}` | no |
| <a name="input_secret"></a> [secret](#input\_secret) | The environment variables from parameter store to use in Container | `list(map(string))` | `[]` | no |
| <a name="input_source_security_group_ids"></a> [source\_security\_group\_ids](#input\_source\_security\_group\_ids) | The source security group IDs to use in Service | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags to use | `map(string)` | `{}` | no |
| <a name="input_target_group_arn"></a> [target\_group\_arn](#input\_target\_group\_arn) | The arn of the target group to point at the service containers. | `string` | n/a | yes |
| <a name="input_target_port"></a> [target\_port](#input\_target\_port) | The target port exposed in the container | `number` | n/a | yes |
| <a name="input_task_role_arn"></a> [task\_role\_arn](#input\_task\_role\_arn) | The short name or full Amazon Resource Name (ARN) of the IAM role that containers in this task can assume | `string` | `null` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The VPC ID to use | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | ID that identifies the cluster |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | Name that identifies the cluster |
| <a name="output_ecr_repository_name"></a> [ecr\_repository\_name](#output\_ecr\_repository\_name) | The name of the ECR repository |
| <a name="output_ecr_repository_url"></a> [ecr\_repository\_url](#output\_ecr\_repository\_url) | The URL of the ECR repository |
| <a name="output_security_group_ids"></a> [security\_group\_ids](#output\_security\_group\_ids) | The IDs of the security groups |
| <a name="output_subnet_ids"></a> [subnet\_ids](#output\_subnet\_ids) | The IDs of the subnets |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The ID of the VPC |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
