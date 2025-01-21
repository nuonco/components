resource "kubectl_manifest" "manifest" {
  yaml_body = yamlencode(yamldecode(var.yaml_body))
}
