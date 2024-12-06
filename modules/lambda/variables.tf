variable "primary_autoscaling_group" {
  description = "Name of the primary region Auto Scaling group"
  type        = string
}

variable "backup_autoscaling_group" {
  description = "Name of the backup region Auto Scaling group"
  type        = string
}

variable "backup_fqdn" {
  description = "Name of the backup region Auto Scaling group"
  type        = string
}

variable "sns_topic_arn" {
  description = "SNS topic ARN to trigger Lambda"
  type        = string
}


variable "read_replica_instance" {
  description = "RDS read replica identifier"
  type        = string
}

variable "backup_asg_name" {
  description = "Backup Auto Scaling group name"
  type        = string
}

variable "primary_fqdn" {
  description = "Fully qualified domain name for the primary region"
  type        = string
}

variable "zone_id" {
  description = "Route 53 Hosted Zone ID"
  type        = string
}

