# RDS Subnet

Component to create an RDS Subnet for use by RDS Clusters and Instances. This
component should be created before RDS resources that are deployed onto the
subnet.

## Inputs/Variables

| Variable                  | Description                        | Example                                                                                                                                   |
| ------------------------- | ---------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| `region`                  | AWS Region                         | `{{.nuon.install.sandbox.outputs.aws_account.region}}`                                                                                    |
| `install_id`              | The Nuon App Install ID            | `{{.nuon.install.id}}`                                                                                                                    |
| `rds_subnet_name`         | The name for the RDS subnet group. | `rds-subnet-{{.nuon.install.id}}`                                                                                                         |
| `rds_subnet_display_name` | RDS Subnet Display Name            | `{{.nuon.install.sandbox.outputs.vpc.default_security_group_id}}`                                                                         |
| `private_subnet_ids`      | Private Subnet IPS                 | `{{index .nuon.install.sandbox.outputs.vpc.private_subnet_ids 0}}, ..., {{index .nuon.install.sandbox.outputs.vpc.private_subnet_ids n}}` |

Note: we do not pass a vpc id. the vpc wil be the vpc the private_subnet_ids
belong to. Note: the db will only be available within the vpc.

## Outputs

| Output   | Description           |
| -------- | --------------------- |
| `id`     | The RDS Subnet ID     |
| `arn`    | The RDS Subnet ARN    |
| `vpc_id` | The RDS Subnet VPC ID |

## Example Configuration

```toml
#:schema https://api.nuon.co/v1/general/config-schema?source=terraform
name              = "rds_subnet"
type              = "terraform_module"
terraform_version = "1.11.3"

[connected_repo]
repo      = "nuonco/components"
directory = "aws/rds_subnet"
branch    = "main"

[vars]
# aws details
region             = "{{ .nuon.install.sandbox.outputs.account.region }}"
private_subnet_ids = "{{ index .nuon.install.sandbox.outputs.vpc.private_subnet_ids 0}},{{ index .nuon.install.sandbox.outputs.vpc.private_subnet_ids 1 }},{{ index .nuon.install.sandbox.outputs.vpc.private_subnet_ids 2 }}"
# rds subnet details
install_id              = "{{.nuon.install.id}}"
rds_subnet_name         = "rds-subnet-{{.nuon.install.id}}"
rds_subnet_display_name = "RDS Subnet {{.nuon.install.id}}"
```
