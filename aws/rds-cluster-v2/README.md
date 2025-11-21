# RDS Postgres Cluster

Component to create an postgres RDS cluster. This is a great component for getting started, but you will likely want a
more specific set of configurations so we recommend forking this component.

## Requirements

| Name                                                                     | Version   |
| ------------------------------------------------------------------------ | --------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.13.5 |
| <a name="requirement_aws"></a> [aws](#requirement_aws)                   | = 6.21.0  |

## Providers

| Name                                             | Version |
| ------------------------------------------------ | ------- |
| <a name="provider_aws"></a> [aws](#provider_aws) | 6.21.0  |

## Modules

| Name                                      | Source                        | Version |
| ----------------------------------------- | ----------------------------- | ------- |
| <a name="module_db"></a> [db](#module_db) | terraform-aws-modules/rds/aws | 6.13.1  |

## Resources

| Name                                                                                                                        | Type        |
| --------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [aws_security_group.allow_psql](https://registry.terraform.io/providers/hashicorp/aws/6.21.0/docs/resources/security_group) | resource    |
| [aws_subnets.private](https://registry.terraform.io/providers/hashicorp/aws/6.21.0/docs/data-sources/subnets)               | data source |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/6.21.0/docs/data-sources/vpc)                           | data source |

## Inputs

| Name                                                                                                                                       | Description                                                | Type     | Default          | Required |
| ------------------------------------------------------------------------------------------------------------------------------------------ | ---------------------------------------------------------- | -------- | ---------------- | :------: |
| <a name="input_allocated_storage"></a> [allocated_storage](#input_allocated_storage)                                                       | Allocated storage                                          | `string` | `100`            |    no    |
| <a name="input_apply_immediately"></a> [apply_immediately](#input_apply_immediately)                                                       | Set to true if the changes should be applied immediately.  | `string` | `"false"`        |    no    |
| <a name="input_db_name"></a> [db_name](#input_db_name)                                                                                     | The name of the default database.                          | `string` | n/a              |   yes    |
| <a name="input_db_user"></a> [db_user](#input_db_user)                                                                                     | The name of the admin user.                                | `string` | n/a              |   yes    |
| <a name="input_deletion_protection"></a> [deletion_protection](#input_deletion_protection)                                                 | Whether or not the enable deletion protection.             | `string` | `"false"`        |    no    |
| <a name="input_iam_database_authentication_enabled"></a> [iam_database_authentication_enabled](#input_iam_database_authentication_enabled) | Whether or not the enable RDS IAM authentication.          | `string` | `"true"`         |    no    |
| <a name="input_identifier"></a> [identifier](#input_identifier)                                                                            | Human friendly (ish) identifier for the cluster.           | `string` | n/a              |   yes    |
| <a name="input_instance_class"></a> [instance_class](#input_instance_class)                                                                | n/a                                                        | `string` | `"db.t4g.micro"` |    no    |
| <a name="input_nuon_install_id"></a> [nuon_install_id](#input_nuon_install_id)                                                             | The Nuon Install ID ({{ .nuon.install.id }}.               | `string` | n/a              |   yes    |
| <a name="input_port"></a> [port](#input_port)                                                                                              | n/a                                                        | `string` | `"5432"`         |    no    |
| <a name="input_region"></a> [region](#input_region)                                                                                        | The AWS region ({{ .nuon.install\_stack.outputs.region }}. | `string` | n/a              |   yes    |
| <a name="input_subnet_group_id"></a> [subnet_group_id](#input_subnet_group_id)                                                             | The RDS subnet group for this RDS Cluster.                 | `string` | n/a              |   yes    |
| <a name="input_vpc_id"></a> [vpc_id](#input_vpc_id)                                                                                        | network details                                            | `string` | n/a              |   yes    |

## Outputs

| Name                                                                                                                                      | Description |
| ----------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| <a name="output_address"></a> [address](#output_address)                                                                                  | n/a         |
| <a name="output_db_instance_master_user_secret_arn"></a> [db_instance_master_user_secret_arn](#output_db_instance_master_user_secret_arn) | n/a         |
| <a name="output_db_instance_port"></a> [db_instance_port](#output_db_instance_port)                                                       | n/a         |
| <a name="output_db_instance_resource_id"></a> [db_instance_resource_id](#output_db_instance_resource_id)                                  | n/a         |
| <a name="output_endpoint"></a> [endpoint](#output_endpoint)                                                                               | n/a         |
