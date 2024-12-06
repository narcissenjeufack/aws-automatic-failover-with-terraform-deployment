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
