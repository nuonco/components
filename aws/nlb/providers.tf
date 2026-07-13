provider "aws" {
  region = var.region

  default_tags {
    tags = local.tags
  }
}

locals {
  tags = {
    "install.nuon.co/id"     = var.install_id
    "component.nuon.co/name" = "nlb"
  }
}
