# Output for Primary Health Check ID
output "primary_health_check_id" {
  description = "The ID of the primary Route 53 health check."
  value       = aws_route53_health_check.primary.id
}

# Output for Backup Health Check ID
output "backup_health_check_id" {
  description = "The ID of the backup Route 53 health check."
  value       = aws_route53_health_check.backup.id
}

# Output for Primary Route 53 Record Name
output "primary_record_name" {
  description = "The name of the primary Route 53 record."
  value       = aws_route53_record.primary.name
}

# Output for Backup Route 53 Record Name
output "backup_record_name" {
  description = "The name of the backup Route 53 record."
  value       = aws_route53_record.backup.name
}

# Output for Zone ID
output "zone_id" {
  description = "The Zone ID for the Route 53 hosted zone."
  value       = var.zone_id
}
