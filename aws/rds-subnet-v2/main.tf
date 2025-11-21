resource "aws_db_subnet_group" "rds_subnet" {
  name       = var.rds_subnet_name
  subnet_ids = data.aws_subnets.private.ids
  tags = {
    Name = var.rds_subnet_display_name,
  }
}
