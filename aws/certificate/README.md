# Certificate

## Inputs/Variables

| Variable  | Description                                          | Example                                                 |
| --------- | ---------------------------------------------------- | ------------------------------------------------------- |
| zone_id   | The ID of the zone. Can be sourced from the sandbox. | {{.nuon.install.sandbox.outputs.public_domain.zone_id}} |
| domain_id |                                                      |                                                         |

## Example Configuration

```toml
name = "certificate"
type = "terraform_module"
terraform_version = "1.7.5"

[public_repo]
repo      = "nuonco/components"
directory = "aws/certificate"
branch    = "main"

[vars]
zone_id     = "{{.nuon.install.sandbox.outputs.public_domain.zone_id}}"
domain_name = "{{.nuon.install.sandbox.outputs.public_domain.name}}"
# or, using a subdomain
# domain_name = "subdomain.{{.nuon.install.sandbox.outputs.public_domain.name}}"
```
