# RDS Postgres Cluster

## Inputs/Variables

| Variable       | Description                                        | Example |
| -------------- | -------------------------------------------------- | ------- |
| identifier     | Name of the RDS Cluster. Typically the install id. | 5432    |
| port           | DB Port                                            | 5432    |
| db_name        | The name for the default DB.                       | prod    |
| db_user        | The name for the default user.                     | admin   |
| db_password    | DB Password                                        |         |
| subnet_ids     |                                                    |         |
| security_group |                                                    |         |

Note: the db_password can be passed in but in the future this module will be
updated to use an autogenerated password stored in an AWS Secrets Manager.

## Example Configuration

```toml
name              = "rds_cluster"
type              = "terraform_module"
terraform_version = "1.7.5"

[connected_repo]
directory = "src/rds-cluster"
repo      = "nuonco-shared/retool"
branch    = "main"

[vars]
port           = "5432"
identifier     = "{{.nuon.install.id}}"
db_name        = "retool"
db_user        = "retool"
db_password    = "{{.nuon.install.inputs.db_password}}"
subnet_ids     = "{{index .nuon.install.sandbox.outputs.vpc.private_subnet_ids 0}}, {{index .nuon.install.sandbox.outputs.vpc.private_subnet_ids 1}}, {{index .nuon.install.sandbox.outputs.vpc.private_subnet_ids 2}}"
security_group = "{{.nuon.install.sandbox.outputs.vpc.default_security_group_id}}"
```
