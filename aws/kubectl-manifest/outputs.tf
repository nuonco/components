output "kind" {
  value = kubectl_manifest.manifest.kind
}

output "name" {
  value = kubectl_manifest.manifest.name
}

output "namespace" {
  value = kubectl_manifest.manifest.namespace
}

output "yaml_body_parsed" {
  value     = kubectl_manifest.manifest.yaml_body_parsed
  sensitive = true
}

// TODO(fd): remove this outpu
output "install_name" {
  value = var.install_name
}
