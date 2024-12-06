output "primary_db_endpoint" {
  description = "Primary RDS endpoint"
  value       = aws_db_instance.primary.endpoint
}

output "read_replica_endpoint" {
  description = "Read Replica endpoint"
  value       = aws_db_instance.read_replica.endpoint
}
