# ECS | EC2 Capacity Provider

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.20 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.24.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_autoscaling"></a> [autoscaling](#module\_autoscaling) | terraform-aws-modules/autoscaling/aws | ~> 6.5 |
| <a name="module_ecs_cluster"></a> [ecs\_cluster](#module\_ecs\_cluster) | terraform-aws-modules/ecs/aws | ~> 4.0 |
| <a name="module_ecs_service"></a> [ecs\_service](#module\_ecs\_service) | leonardobiffi/ecs-service/aws | 1.1.0 |
| <a name="module_ecs_task_definition"></a> [ecs\_task\_definition](#module\_ecs\_task\_definition) | mongodb/ecs-task-definition/aws | 2.1.5 |
| <a name="module_security_group_asg"></a> [security\_group\_asg](#module\_security\_group\_asg) | terraform-aws-modules/security-group/aws | ~> 4.9 |
| <a name="module_security_group_ecs"></a> [security\_group\_ecs](#module\_security\_group\_ecs) | terraform-aws-modules/security-group/aws | ~> 4.9 |

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_ecr_lifecycle_policy.name](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_lifecycle_policy) | resource |
| [aws_ecr_repository.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |
| [aws_iam_role.ecs_tasks_execution_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.ecs_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy_attachment.ecs_tasks_execution_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_ecs_task_definition.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ecs_task_definition) | data source |
| [aws_iam_policy_document.ecs_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.ecs_tasks_execution_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_ssm_parameter.ecs_optimized_ami](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app"></a> [app](#input\_app) | The name of the app | `string` | n/a | yes |
| <a name="input_capacity_provider_strategy"></a> [capacity\_provider\_strategy](#input\_capacity\_provider\_strategy) | The capacity provider strategy to use in Cluster | `map(string)` | <pre>{<br>  "base": 100<br>}</pre> | no |
| <a name="input_container_port"></a> [container\_port](#input\_container\_port) | The port to expose in the container | `number` | n/a | yes |
| <a name="input_cpu"></a> [cpu](#input\_cpu) | The amount of CPU to use in task | `number` | `256` | no |
| <a name="input_desired_count"></a> [desired\_count](#input\_desired\_count) | The desired count of the service | `number` | `1` | no |
| <a name="input_env"></a> [env](#input\_env) | The environment to use | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment variables to use in Container | `list(map(string))` | `[]` | no |
| <a name="input_health_check_grace_period_seconds"></a> [health\_check\_grace\_period\_seconds](#input\_health\_check\_grace\_period\_seconds) | The health check grace period seconds to use in Service | `number` | `0` | no |
| <a name="input_ingress_cidr_blocks"></a> [ingress\_cidr\_blocks](#input\_ingress\_cidr\_blocks) | The ingress cidr blocks to use in Service | `list(string)` | `[]` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The instance type to use in AutoScalingGroup | `string` | n/a | yes |
| <a name="input_log_retention_days"></a> [log\_retention\_days](#input\_log\_retention\_days) | The number of days to keep logs | `number` | `7` | no |
| <a name="input_max_image_count"></a> [max\_image\_count](#input\_max\_image\_count) | The maximum number of images to keep in ECR | `number` | `10` | no |
| <a name="input_max_scaling_size"></a> [max\_scaling\_size](#input\_max\_scaling\_size) | The maximum number of instances to keep in AutoScalingGroup | `number` | `3` | no |
| <a name="input_memory"></a> [memory](#input\_memory) | The amount of memory to use in task | `number` | `512` | no |
| <a name="input_min_scaling_size"></a> [min\_scaling\_size](#input\_min\_scaling\_size) | The minimum number of instances to keep in AutoScalingGroup | `number` | `1` | no |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | The private subnets to use | `list(string)` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The AWS region to use | `string` | `"us-east-1"` | no |
| <a name="input_scaling_target_capacity"></a> [scaling\_target\_capacity](#input\_scaling\_target\_capacity) | The target capacity of AutoScalingGroup in Cluster. 0 to 100 | `number` | `100` | no |
| <a name="input_schedule_tag"></a> [schedule\_tag](#input\_schedule\_tag) | The tag to use to schedule start and stop of the service | `map(string)` | `{}` | no |
| <a name="input_secret"></a> [secret](#input\_secret) | The environment variables from parameter store to use in Container | `list(map(string))` | `[]` | no |
| <a name="input_source_security_group_ids"></a> [source\_security\_group\_ids](#input\_source\_security\_group\_ids) | The source security group IDs to use in Service | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags to use | `map(string)` | `{}` | no |
| <a name="input_target_group_arn"></a> [target\_group\_arn](#input\_target\_group\_arn) | The arn of the target group to point at the service containers. | `string` | n/a | yes |
| <a name="input_target_port"></a> [target\_port](#input\_target\_port) | The target port exposed in the container | `number` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The VPC ID to use | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ecr_repository_name"></a> [ecr\_repository\_name](#output\_ecr\_repository\_name) | The name of the ECR repository |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
