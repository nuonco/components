data "external" "env" {
  program = ["${path.module}/env.sh"]
}
