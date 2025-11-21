locals {
  tags = {
    "install.nuon.co/id"     = var.nuon_install_id
    "component.nuon.co/name" = "rds-subnet"
  }
}

variable "region" {
  type = string
}

variable "vpc_id" {
  type        = string
  description = "The VPC ID"
}


variable "nuon_install_id" {
  type        = string
  description = "The id of the install."
}

variable "rds_subnet_name" {
  type        = string
  description = "The name of the rds subnet."
}

variable "rds_subnet_display_name" {
  type        = string
  description = "The name of the rds subnet for use in the Name Tag"
}
