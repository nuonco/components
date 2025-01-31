# ALB

Component to provision an ingress w/ annotations to make use of an AWS Certificate Manager SSL Certificate via the
['certificate' component](../certificate).

## Inputs/Variables

| Variable             | Description                                             | Example                                                                  |
| -------------------- | ------------------------------------------------------- | ------------------------------------------------------------------------ |
| `install_name`       | Typically, the install id.                              | `{{.nuon.install.id}}`                                                   |
| `domain`             | The ID of the zone. Can be sourced from the sandbox.    | `{{.nuon.install.sandbox.outputs.public_domain.name}}`                   |
| `domain_certificate` | AWS Cerficate Manager Certificate ARN.                  | `{{.nuon.components.certificate.outputs.public_domain_certificate_arn}}` |
| `service_name`       | The name of the service this ingress routes traffic to. | `api`                                                                    |

## Example Configuration

```toml
name       = "application_load_balancer"
type       = "helm_chart"
chart_name = "application-load-balancer"

[connected_repo]
directory = "aws/alb"
repo      = "nuonco/components"
branch    = "main"

[values]
service_name       = "api"
install_name       = "{{.nuon.install.id}}"
domain_certificate = "{{.nuon.components.certificate.outputs.public_domain_certificate_arn}}"
domain             = "api.{{.nuon.install.sandbox.outputs.public_domain.name}}"
```

## Note

This component depends on outputs of the [`certificate` component](../certificate). It is important to note, the
`domain_name` of the certificate component should match the `domain` value here.
