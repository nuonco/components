# Kubeclt Manifest

Cloud agnostic tf module w/ `kubectl` provider to apply arbitrary k8s manifests.

## Inputs/Variables

| Variable     | Description                                               | Example                                                        |
| ------------ | --------------------------------------------------------- | -------------------------------------------------------------- |
| install_name | The install id                                            | `{{.nuon.install.id}}`                                         |
| cluster_name | The name of the cluster - sourced from the sandbox.       | `{{.nuon.install.sandbox.outputs.cluster.name}}`               |
| iam_role_arn | The name of the role to invoke the `aws eks` cli cmd with | `{{.nuon.install.sandbox.outputs.runner.runner_iam_role_arn}}` |
| yaml_body    | YAML k8s manifest - multi-line string                     |                                                                |

## Example Configuration

```toml
name = "kubectl_manifest"
type = "terraform_module"
terraform_version = "1.9.3"

[public_repo]
repo      = "nuonco/components"
directory = "aws/kubectl-manifest"
branch    = "main"

[vars]
install_name = "{{.nuon.install.id}}"
cluster_name = "{{.nuon.install.sandbox.outputs.cluster.name}}"
iam_role_arn = "{{.nuon.install.sandbox.outputs.runner.runner_iam_role_arn}}"
yaml_body = """
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: api-configs
  namespace: {{.nuon.install.id}}
data:
  DEBUG: {{.nuon.install.inputs.debug}}
  LOG_LEVEL: {{.nuon.install.inputs.log_level}}
  PORT: {{.nuon.install.inputs.port}}
"""
```
