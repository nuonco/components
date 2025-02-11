locals {
  subnet_ids = split(",", trim(replace(var.subnet_ids, " ", ","), "[]"))
}

// docs: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group
resource "aws_security_group" "allow_psql" {
  vpc_id      = var.vpc_id
  name        = "allow_psql"
  description = "Allow PSQL inbound traffic and all outbound traffic"

  tags = {
    Name = "allow_psql"
  }

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
  manage_master_user_password = true

  deletion_protection    = false
  create_db_subnet_group = false

  multi_az               = false
  subnet_ids             = local.subnet_ids # expects rds subnet group id
  db_subnet_group_name   = var.subnet_group_id
  vpc_security_group_ids = [resource.aws_security_group.allow_psql.id]

  parameters = [
    {
      apply_method = "immediate"
      name         = "rds.force_ssl"
      value        = "0"
    }
  ]

  depends_on = [resource.aws_security_group.allow_psql]
}
