module "db" {
  source = "terraform-aws-modules/rds/aws"

  identifier        = var.identifier
  engine            = "postgres"
  family            = "postgres15"
  engine_version    = "15"
  instance_class    = var.instance_class
  allocated_storage = 5
  port              = var.port
  db_name           = var.db_name

  username                    = var.db_user
  manage_master_user_password = true

  iam_database_authentication_enabled = local.iam_database_authentication_enabled
  apply_immediately                   = local.apply_immediately

  deletion_protection    = local.deletion_protection
  create_db_subnet_group = false

  multi_az               = false
  subnet_ids             = local.subnet_ids
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
