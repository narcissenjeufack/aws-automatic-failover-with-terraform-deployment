# Provider Configuration
provider "aws" {
  region = var.region
}

# Call the EC2 module
module "ec2" {
  source           = "./modules/ec2"
  ami_id           = var.ami_id
  instance_type    = var.instance_type
  primary_subnets  = var.primary_subnets
  backup_subnets   = var.backup_subnets
  vpc_id           = var.vpc_id
  primary_min_size = var.primary_min_size
  primary_max_size = var.primary_max_size
  backup_min_size  = var.backup_min_size
  backup_max_size  = var.backup_max_size
}

# Call the RDS module
module "rds" {
  source               = "./modules/rds"
  allocated_storage    = var.allocated_storage
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  db_name              = var.db_name
  username             = var.username
  password             = var.password
  db_subnet_group_name = var.db_subnet_group_name
  vpc_id               = var.vpc_id
  kms_key_id           = var.kms_key_id
  monitoring_role_arn  = var.monitoring_role_arn
}

# Call the Route 53 module
module "route53" {
  source          = "./modules/route53"
  zone_id         = var.zone_id
  primary_fqdn    = var.primary_fqdn
  backup_fqdn     = var.backup_fqdn
  primary_alb_dns = module.ec2.primary_alb_dns
  backup_alb_dns  = module.ec2.backup_alb_dns
  primary_alb_zone_id = var.primary_alb_zone_id
  backup_alb_zone_id = var.backup_alb_zone_id
}

# Call the Lambda module
module "lambda" {
  source                  = "./modules/lambda"
  read_replica_instance   = module.rds.read_replica_id
  backup_asg_name         = module.ec2.backup_asg_name
  sns_topic_arn           = module.route53.sns_topic_arn
  #health_check_id         = module.route53.health_check_id
  zone_id                 = module.route53.zone_id
  primary_fqdn            = module.route53.primary_fqdn
  backup_autoscaling_group = module.lambda.backup_autoscaling_group
  backup_fqdn            = module.lambda.backup_fqdn
  primary_autoscaling_group = module.lambda.primary_autoscaling_group
}



