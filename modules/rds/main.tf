resource "aws_db_instance" "primary" {
  allocated_storage       = var.allocated_storage
  engine                  = "mysql"
  engine_version          = var.engine_version
  instance_class          = var.instance_class
  db_name                 = var.db_name  # Correct attribute for database name
  username                = var.username
  password                = var.password
  multi_az                = true
  publicly_accessible     = false
  storage_type            = "gp2"
  backup_retention_period = 7  # Retention period in days for backups

  db_subnet_group_name    = var.db_subnet_group_name  # Ensure you're providing the correct subnet group
  vpc_security_group_ids  = [aws_security_group.db_sg.id]  # Reference the security group for your DB

  tags = {
    Name = "primary-db-instance"
  }

  # Optional: Storage encryption
  storage_encrypted = true
  kms_key_id        = var.kms_key_id  # If using KMS for encryption

  # Optional: Maintenance window settings
  #preferred_maintenance_window = "Sun:00:00-Sun:03:00"

  # Optional: Automatically apply minor version upgrades
  auto_minor_version_upgrade = true

  # Optional: Monitoring settings (if applicable)
  monitoring_interval         = 60
  monitoring_role_arn         = var.monitoring_role_arn  # IAM role for monitoring
}

