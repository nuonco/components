output "endpoint" {
  value = module.db.db_instance_endpoint
}

output "address" {
  value = module.db.db_instance_address
}

output "db_instance_master_user_secret_arn" {
  value = module.db.db_instance_master_user_secret_arn
}

output "db_instance_resource_id" {
  value = module.db.db_instance_resource_id
}

output "db_instance_port" {
  value = module.db.db_instance_port
}
