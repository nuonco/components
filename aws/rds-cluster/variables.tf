variable "identifier" {
  type = string
}

variable "port" {
  type    = string
  default = "5432"
}

variable "db_name" {
  type = string
}

variable "db_user" {
  type = string
}

variable "db_password" {
  type = string
}

variable "subnet_ids" {
  type = string
}

variable "security_group" {
  type = string
}

variable "vpc_id" {
  type = string
}
