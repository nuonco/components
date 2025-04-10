# External Secrets

Component to provision an AWS Certificate Manager SSL Certificate.

## Inputs/Variables

| Variable       | Description                                          | Example                                            |
| -------------- | ---------------------------------------------------- | -------------------------------------------------- |
| `install_id`   | Nuon install ID                                      | `{{.nuon.install.id}}`                             |
| `region`       | The ID of the zone. Can be sourced from the sandbox. | `{{.nuon.install.sandbox.outputs.account.region}}` |
| `cluster_name` | The domain name. Usually provided by the sandbox.    | `{{.nuon.install.sandbox.outputs.cluster.name}}`   |
| `iam_role_arn` |                                                      |                                                    |

## Example Configuration

```toml
name              = "external_secrets"
type              = "terraform_module"
terraform_version = "1.11.3"

[public_repo]
repo      = "nuonco/components"
directory = "aws/external_secrets"
branch    = "main"

[vars]
region       = "{{.nuon.install.sandbox.outputs.account.region}}"
cluster_name = "{{.nuon.install.sandbox.outputs.cluster.name}}"
iam_role_arn = "{{.nuon.install.sandbox.outputs.runner.runner_iam_role_arn}}"
install_id   = "{{.nuon.install.id}}"
```
