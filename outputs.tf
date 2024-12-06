output "backup_route53_record" {
  description = "Details of the backup Route 53 record"
  value       = aws_route53_record.backup_record
}

output "primary_health_check_id" {
  value = module.route53.primary_health_check_id
}

output "backup_health_check_id" {
  value = module.route53.backup_health_check_id
}

output "primary_record_name" {
  value = module.route53.primary_record_name
}

output "backup_record_name" {
  value = module.route53.backup_record_name
}

# Outputs
output "primary_rds_instance_endpoint" {
  value = module.rds.primary_instance_endpoint
}

output "backup_rds_read_replica_endpoint" {
  value = module.rds.read_replica_endpoint
}

output "primary_health_check_id" {
  value = module.route53.primary_health_check_id
}

output "backup_health_check_id" {
  value = module.route53.backup_health_check_id
}

output "lambda_function_name" {
  value = module.lambda.lambda_function_name
}