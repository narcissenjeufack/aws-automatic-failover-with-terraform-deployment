# Create Launch Configuration for EC2 Instances
resource "aws_launch_configuration" "app" {
  name          = "app-launch-configuration"
  image_id      = var.ami_id
  instance_type = var.instance_type
  security_groups = [aws_security_group.app_sg.id]

  lifecycle {
    create_before_destroy = true
  }
}

# Primary Region Auto Scaling Group
resource "aws_autoscaling_group" "primary" {
  launch_configuration = aws_launch_configuration.app.id
  min_size             = var.primary_min_size
  max_size             = var.primary_max_size
  desired_capacity     = var.primary_desired_capacity
  vpc_zone_identifier  = var.primary_subnets

  tag {
    key                 = "Name"
    value               = "app-primary"
    propagate_at_launch = true
  }
}

# Backup Region Auto Scaling Group
resource "aws_autoscaling_group" "backup" {
  launch_configuration = aws_launch_configuration.app.id
  min_size             = var.backup_min_size
  max_size             = var.backup_max_size
  desired_capacity     = var.backup_desired_capacity
  vpc_zone_identifier  = var.backup_subnets

  tag {
    key                 = "Name"
    value               = "app-backup"
    propagate_at_launch = true
  }
}

# Security Group for EC2 Instances
resource "aws_security_group" "app_sg" {
  name        = "app-security-group"
  description = "Allow HTTP and SSH"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
