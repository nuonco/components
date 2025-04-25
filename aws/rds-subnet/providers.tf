provider "aws" {
  region       = var.region
  default_tags = local.tags
}
