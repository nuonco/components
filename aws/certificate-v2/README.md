# Certificate

Component to provision an AWS Certificate Manager SSL Certificate.

## Inputs/Variables

| Variable      | Description                                            | Example                                                   |
| ------------- | ------------------------------------------------------ | --------------------------------------------------------- |
| `zone_id`     | The ID of the zone. Can be sourced from the sandbox.   | `{{.nuon.install.sandbox.outputs.public_domain.zone_id}}` |
| `domain_name` | The domain name. Usually provided by the sandbox.      | `{{.nuon.install.sandbox.outputs.public_domain.name}}`    |
| `region`      | The AWS region. Usually provided by the install stack. | `{{.nuon.install_stack.outputs.region }}`                 |
| `Install Id`  | The Install Id.                                        | `{{.nuon.install.id }}`                                   |

## Example Configuration

```toml
name = "certificate"
type = "terraform_module"
terraform_version = "1.11.3"

[public_repo]
repo      = "nuonco/components"
directory = "aws/certificate"
branch    = "main"

[vars]
install_id  = "{{ .nuon.install.id }}"
region      = "{{ .nuon.install_stack.outputs.region }}"
zone_id     = "{{ .nuon.sandbox.outputs.nuon_dns.public_domain.zone_id }}"
domain_name = "subdomain.{{.nuon.install.sandbox.outputs.public_domain.name}}"
# NOTE: it is also possible to use a subdomain or wildcard here.
# domain_name = "*.{{.nuon.install.sandbox.outputs.public_domain.name}}"
```
