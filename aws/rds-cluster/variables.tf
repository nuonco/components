locals {
  subnet_ids = split(",", trim(replace(var.subnet_ids, " ", ","), "[]"))
  tags = {
    "install.nuon.co/id"     = var.nuon_id
    "component.nuon.co/name" = "rds-cluster"
  }
}
# network details
variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type        = string
  description = "Comma-delimited string of subnet ids to be split for use in this tf."
}

variable "subnet_group_id" {
  type = string
}

# databse details
variable "identifier" {
  type = string
}

variable "port" {
  type    = string
  default = "5432"
}

variable "instance_class" {
  type    = string
  default = "db.t4g.micro"
}

variable "db_name" {
  type = string
}

variable "db_user" {
  type = string
}
