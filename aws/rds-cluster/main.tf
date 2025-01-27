locals {
  subnet_ids = split(",", replace(replace(var.subnet_ids, " ", ""), "\n", ""))
}

resource "aws_default_security_group" "default" {
  vpc_id = var.vpc_id
  ingress {
    from_port   = 5432
    cidr_blocks = ["0.0.0.0/0"]
    to_port     = 5432
    protocol    = "tcp"
  }
}

module "db" {
  source = "terraform-aws-modules/rds/aws"

  identifier        = var.identifier
  engine            = "postgres"
  family            = "postgres15"
  engine_version    = "15"
  instance_class    = "db.t4g.micro"
  allocated_storage = 5
  db_name           = var.db_name
  username          = var.db_user
  port              = var.port

  # NOTE(fd): for this PoC, we use this method
  # long-term, we'll rely on the managed pw in AWS Secrets Manager
  password                    = var.db_password
  manage_master_user_password = false

  deletion_protection = false

  multi_az               = false
  create_db_subnet_group = true
  subnet_ids             = local.subnet_ids
  vpc_security_group_ids = [var.security_group]

  parameters = [
    {
      apply_method = "immediate"
      name         = "rds.force_ssl"
      value        = "0"
    }
  ]

  depends_on = [resource.aws_default_security_group.default]
}
