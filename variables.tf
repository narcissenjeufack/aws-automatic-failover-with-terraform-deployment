
variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "zone_id" {
  description = "The ID of the Route 53 hosted zone."
  type        = string
}

variable "primary_fqdn" {
  description = "FQDN for the primary endpoint."
  type        = string
}

variable "primary_alb_dns" {
  description = "DNS name of the primary ALB."
  type        = string
}

variable "primary_alb_zone_id" {
  description = "Zone ID of the primary ALB."
  type        = string
}

variable "backup_fqdn" {
  description = "FQDN for the backup endpoint."
  type        = string
}

variable "backup_alb_dns" {
  description = "DNS name of the backup ALB."
  type        = string
}

variable "backup_alb_zone_id" {
  description = "Zone ID of the backup ALB."
  type        = string
}

variable "primary_health_check_path" {
  description = "Health check path for the primary endpoint."
  type        = string
  default     = "/"
}

variable "backup_health_check_path" {
  description = "Health check path for the backup endpoint."
  type        = string
  default     = "/"
}

variable "health_check_failure_threshold" {
  description = "Number of consecutive failures before marking an endpoint unhealthy."
  type        = number
  default     = 3
}



variable "allocated_storage" {
  description = "The allocated storage in GB"
  type        = number
  default     = 20
}

variable "engine_version" {
  description = "The engine version for the MySQL DB instance"
  type        = string
}

variable "instance_class" {
  description = "The instance class for the DB instance"
  type        = string
}

variable "db_name" {
  description = "The name of the DB instance"
  type        = string
}

variable "username" {
  description = "The username for the DB instance"
  type        = string
}

variable "password" {
  description = "The password for the DB instance"
  type        = string
  sensitive   = true
}

variable "db_subnet_group_name" {
  description = "The DB subnet group name"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID for the RDS instance"
  type        = string
}

variable "kms_key_id" {
  description = "The KMS key ID for storage encryption"
  type        = string
}

variable "monitoring_role_arn" {
  description = "The ARN of the IAM role for monitoring"
  type        = string
}


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


# EC2 Module Variables
variable "ami_id" {
  description = "AMI ID for the EC2 instances"
  type        = string
  default     = "ami-0abcdef1234567890" # Replace with a valid AMI ID
}

variable "instance_type" {
  description = "Instance type for the EC2 instances"
  type        = string
  default     = "t2.micro"
}

variable "primary_min_size" {
  description = "Minimum size for the primary Auto Scaling group"
  type        = number
  default     = 1
}

variable "primary_max_size" {
  description = "Maximum size for the primary Auto Scaling group"
  type        = number
  default     = 3
}

variable "primary_desired_capacity" {
  description = "Desired capacity for the primary Auto Scaling group"
  type        = number
  default     = 1
}

variable "backup_min_size" {
  description = "Minimum size for the backup Auto Scaling group"
  type        = number
  default     = 0
}

variable "backup_max_size" {
  description = "Maximum size for the backup Auto Scaling group"
  type        = number
  default     = 3
}

variable "backup_desired_capacity" {
  description = "Desired capacity for the backup Auto Scaling group"
  type        = number
  default     = 0
}

variable "primary_subnets" {
  description = "Subnets for the primary Auto Scaling group"
  type        = list(string)
  default     = ["subnet-0abc12345", "subnet-0def67890"] # Replace with your subnets
}

variable "backup_subnets" {
  description = "Subnets for the backup Auto Scaling group"
  type        = list(string)
  default     = ["subnet-1abc12345", "subnet-1def67890"] # Replace with your subnets
}

variable "vpc_id" {
  description = "VPC ID for the application"
  type        = string
  default     = "vpc-0abc1234567890" # Replace with your VPC ID
}



