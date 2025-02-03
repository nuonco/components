// NOTE(fd): pass-through output - saw issues w/ component w/out outputs
output "install_name" {
  value = var.install_name
}

output "yaml_body_parsed" {
  value     = kubectl_manifest.manifest.yaml_body_parsed
  sensitive = true
}

output "kind" {
  value = kubectl_manifest.manifest.kind
}

output "name" {
  value = kubectl_manifest.manifest.name
}

output "namespace" {
  value = kubectl_manifest.manifest.namespace
}

output "yaml_cluster" {
  value     = yamldecode(kubectl_manifest.manifest.yaml_cluster)
  sensitive = true
}

output "live_manifest_incluster" {
  value     = kubectl_manifest.manifest.live_manifest_incluster
  sensitive = true
}
