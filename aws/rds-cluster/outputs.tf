output "endpoint" {
  value = module.db.db_instance_endpoint
}

output "address" {
  value = module.db.db_instance_address
}

output "db_instance_master_user_secret_arn" {
  value = module.db.db_instance_master_user_secret_arn
}

