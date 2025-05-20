locals {
  subnet_ids                          = split(",", trim(replace(var.subnet_ids, " ", ","), "[]"))
  iam_database_authentication_enabled = contains(["true", "1"], var.iam_database_authentication_enabled)
  deletion_protection                 = contains(["true", "1"], var.deletion_protection)
  tags = {
    "component.nuon.co/name" = "rds-cluster"
    "install.nuon.co/id"     = var.nuon_id
  }
}

variable "nuon_id" {
  type        = string
  description = "The Nuon Install ID ({{ .nuon.install.id }}."
}

variable "region" {
  type        = string
  description = "The AWS region ({{ .nuon.install_stack.outputs.region }}."
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
  type        = string
  description = "The RDS subnet group for this RDS Cluster."
}

# databse details
variable "identifier" {
  type        = string
  description = "Human friendly (ish) identifier for the cluster."
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
  type        = string
  description = "The name of the default database."
}

variable "db_user" {
  type        = string
  description = "The name of the admin user."
}

variable "iam_database_authentication_enabled" {
  type        = string
  description = "Whether or not the enable RDS IAM authentication."
  default     = "true"
}

variable "deletion_protection" {
  type        = string
  description = "Whether or not the enable deletion protection."
  default     = "false"
}
