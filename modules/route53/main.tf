# Health Check for Primary Endpoint
resource "aws_route53_health_check" "primary" {
  type                  = "HTTP"
  resource_path         = var.primary_health_check_path
  fqdn                  = var.primary_fqdn
  failure_threshold     = var.health_check_failure_threshold
}

# Health Check for Backup Endpoint
resource "aws_route53_health_check" "backup" {
  type                  = "HTTP"
  resource_path         = var.backup_health_check_path
  fqdn                  = var.backup_fqdn
  failure_threshold     = var.health_check_failure_threshold
}

# Primary Route 53 Record
resource "aws_route53_record" "primary" {
  name    = var.primary_fqdn
  type    = "A"
  zone_id = var.zone_id

  alias {
    name                   = var.primary_alb_dns
    zone_id                = var.primary_alb_zone_id
    evaluate_target_health = true
  }

  set_identifier  = "primary"
  health_check_id = aws_route53_health_check.primary.id
}

# Backup Route 53 Record
resource "aws_route53_record" "backup" {
  name    = var.backup_fqdn
  type    = "A"
  zone_id = var.zone_id

  alias {
    name                   = var.backup_alb_dns
    zone_id                = var.backup_alb_zone_id
    evaluate_target_health = true
  }

  set_identifier  = "backup"
  health_check_id = aws_route53_health_check.backup.id
}


