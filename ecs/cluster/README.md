# ECS | Cluster

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
| <a name="module_autoscaling"></a> [autoscaling](#module\_autoscaling) | terraform-aws-modules/autoscaling/aws | ~> 6.5 |
| <a name="module_ecs_cluster"></a> [ecs\_cluster](#module\_ecs\_cluster) | terraform-aws-modules/ecs/aws | ~> 4.0 |
| <a name="module_security_group_asg"></a> [security\_group\_asg](#module\_security\_group\_asg) | terraform-aws-modules/security-group/aws | ~> 4.9 |

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_ssm_parameter.ecs_optimized_ami](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_asg_capacity_provider_strategy"></a> [asg\_capacity\_provider\_strategy](#input\_asg\_capacity\_provider\_strategy) | The capacity provider strategy to use in Cluster | `map(string)` | <pre>{<br>  "base": 100<br>}</pre> | no |
| <a name="input_asg_instance_type"></a> [asg\_instance\_type](#input\_asg\_instance\_type) | The instance type to use in AutoScalingGroup | `string` | `null` | no |
| <a name="input_asg_max_scaling_size"></a> [asg\_max\_scaling\_size](#input\_asg\_max\_scaling\_size) | The maximum number of instances to keep in AutoScalingGroup | `number` | `3` | no |
| <a name="input_asg_min_scaling_size"></a> [asg\_min\_scaling\_size](#input\_asg\_min\_scaling\_size) | The minimum number of instances to keep in AutoScalingGroup | `number` | `1` | no |
| <a name="input_asg_scaling_target_capacity"></a> [asg\_scaling\_target\_capacity](#input\_asg\_scaling\_target\_capacity) | The target capacity of AutoScalingGroup in Cluster. 0 to 100 | `number` | `100` | no |
| <a name="input_container_insights"></a> [container\_insights](#input\_container\_insights) | Whether to enable container insights. Valid values are enabled or disabled. | `string` | `"disabled"` | no |
| <a name="input_ec2_capacity_provider_enabled"></a> [ec2\_capacity\_provider\_enabled](#input\_ec2\_capacity\_provider\_enabled) | Whether to enable the EC2 capacity provider | `bool` | `false` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Whether to create the resources | `bool` | `true` | no |
| <a name="input_env"></a> [env](#input\_env) | The environment to use | `string` | n/a | yes |
| <a name="input_fargate_capacity_base"></a> [fargate\_capacity\_base](#input\_fargate\_capacity\_base) | The base of the Fargate capacity provider strategy | `number` | `1` | no |
| <a name="input_fargate_capacity_weight"></a> [fargate\_capacity\_weight](#input\_fargate\_capacity\_weight) | The weight of the Fargate capacity provider strategy | `number` | `1` | no |
| <a name="input_fargate_spot_capacity_base"></a> [fargate\_spot\_capacity\_base](#input\_fargate\_spot\_capacity\_base) | The base of the Fargate spot capacity provider strategy | `number` | `null` | no |
| <a name="input_fargate_spot_capacity_weight"></a> [fargate\_spot\_capacity\_weight](#input\_fargate\_spot\_capacity\_weight) | The weight of the Fargate spot capacity provider strategy | `number` | `null` | no |
| <a name="input_iam_role_policies"></a> [iam\_role\_policies](#input\_iam\_role\_policies) | The additioanals IAM role policies to use in Service | `map(string)` | `{}` | no |
| <a name="input_ingress_cidr_blocks"></a> [ingress\_cidr\_blocks](#input\_ingress\_cidr\_blocks) | The ingress cidr blocks to use in Service | `list(string)` | `[]` | no |
| <a name="input_ingress_rules"></a> [ingress\_rules](#input\_ingress\_rules) | The ingress rules to use in Service | `list(string)` | `[]` | no |
| <a name="input_ingress_with_source_security_group_id"></a> [ingress\_with\_source\_security\_group\_id](#input\_ingress\_with\_source\_security\_group\_id) | The ingress with source security group id to use in Service | `list(map(string))` | `[]` | no |
| <a name="input_log_retention_days"></a> [log\_retention\_days](#input\_log\_retention\_days) | The number of days to keep logs | `number` | `7` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the resource | `string` | n/a | yes |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | The private subnets to use | `list(string)` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | The AWS region to use | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags to use | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The VPC ID to use | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | ID that identifies the cluster |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | Name that identifies the cluster |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
