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
