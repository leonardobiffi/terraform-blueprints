# RDS | Simple

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.1 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_rds"></a> [rds](#module\_rds) | terraform-aws-modules/rds/aws | ~> 5.0 |
| <a name="module_security_group"></a> [security\_group](#module\_security\_group) | terraform-aws-modules/security-group/aws | ~> 4.9 |
| <a name="module_store_write"></a> [store\_write](#module\_store\_write) | cloudposse/ssm-parameter-store/aws | 0.10.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allocated_storage"></a> [allocated\_storage](#input\_allocated\_storage) | The RDS allocated storage to use | `number` | n/a | yes |
| <a name="input_app"></a> [app](#input\_app) | The name of the app | `string` | n/a | yes |
| <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately) | The RDS parameter group apply immediately to use | `bool` | `false` | no |
| <a name="input_backup_retention_period"></a> [backup\_retention\_period](#input\_backup\_retention\_period) | The days to retain backups for | `number` | `7` | no |
| <a name="input_backup_window"></a> [backup\_window](#input\_backup\_window) | The RDS backup window to use | `string` | `"03:00-06:00"` | no |
| <a name="input_ca_cert_identifier"></a> [ca\_cert\_identifier](#input\_ca\_cert\_identifier) | Specifies the identifier of the CA certificate for the DB instance | `string` | `"rds-ca-rsa2048-g1"` | no |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | The RDS database name to use | `string` | n/a | yes |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | The RDS parameter group deletion protection to use | `bool` | `false` | no |
| <a name="input_egress_rules"></a> [egress\_rules](#input\_egress\_rules) | The RDS egress rules to use | `list(string)` | n/a | yes |
| <a name="input_engine"></a> [engine](#input\_engine) | The RDS engine to use | `string` | `"mysql"` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | The RDS engine version to use | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | The environment to use | `string` | n/a | yes |
| <a name="input_family"></a> [family](#input\_family) | The RDS parameter group family to use | `string` | n/a | yes |
| <a name="input_ingress_cidr_blocks"></a> [ingress\_cidr\_blocks](#input\_ingress\_cidr\_blocks) | The RDS ingress CIDR blocks to use | `list(string)` | n/a | yes |
| <a name="input_ingress_rules"></a> [ingress\_rules](#input\_ingress\_rules) | The RDS ingress rules to use | `list(string)` | n/a | yes |
| <a name="input_instance_class"></a> [instance\_class](#input\_instance\_class) | The RDS instance class to use | `string` | `"db.t3.micro"` | no |
| <a name="input_iops"></a> [iops](#input\_iops) | The amount of provisioned IOPS. Setting this implies a storage\_type of 'io1' or `gp3`. See `notes` for limitations regarding this variable for `gp3` | `number` | `null` | no |
| <a name="input_maintenance_window"></a> [maintenance\_window](#input\_maintenance\_window) | The RDS maintenance window to use | `string` | `"Sun:00:00-Sun:03:00"` | no |
| <a name="input_major_engine_version"></a> [major\_engine\_version](#input\_major\_engine\_version) | The RDS parameter group major engine version to use | `string` | n/a | yes |
| <a name="input_max_allocated_storage"></a> [max\_allocated\_storage](#input\_max\_allocated\_storage) | The RDS max allocated storage to use | `number` | n/a | yes |
| <a name="input_option_group_name"></a> [option\_group\_name](#input\_option\_group\_name) | The RDS option group name to use | `string` | `null` | no |
| <a name="input_parameters"></a> [parameters](#input\_parameters) | The RDS parameter group parameters to use | `list(any)` | `[]` | no |
| <a name="input_port"></a> [port](#input\_port) | The RDS port to use | `string` | `"3306"` | no |
| <a name="input_region"></a> [region](#input\_region) | The AWS region to use | `string` | `"us-east-1"` | no |
| <a name="input_schedule_tag"></a> [schedule\_tag](#input\_schedule\_tag) | The tag to use to schedule start and stop of the service | `map(string)` | `{}` | no |
| <a name="input_skip_final_snapshot"></a> [skip\_final\_snapshot](#input\_skip\_final\_snapshot) | The RDS parameter group skip final snapshot to use | `bool` | `false` | no |
| <a name="input_storage_type"></a> [storage\_type](#input\_storage\_type) | One of 'standard' (magnetic), 'gp2' (general purpose SSD), 'gp3' (new generation of general purpose SSD), or 'io1' (provisioned IOPS SSD). The default is 'io1' if iops is specified, 'gp2' if not. If you specify 'io1' or 'gp3' , you must also include a value for the 'iops' parameter | `string` | `null` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | The RDS subnet IDs to use | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags to use | `map(string)` | `{}` | no |
| <a name="input_username"></a> [username](#input\_username) | The RDS username to use | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The VPC ID to use | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
