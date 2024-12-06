output "asg_primary_name" {
  value = aws_autoscaling_group.primary.name
}

output "asg_backup_name" {
  value = aws_autoscaling_group.backup.name
}