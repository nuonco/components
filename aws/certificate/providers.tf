provider "aws" {
  region = data.external.env.result.region

  default_tags {
    tags = {
      "install.nuon.co/id"     = data.external.env.result.region
      "component.nuon.co/name" = "certificate"
    }
  }
}
