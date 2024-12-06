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
