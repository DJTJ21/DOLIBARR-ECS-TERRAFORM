provider "aws" {
  region = var.region
}

# Module VPC
module "vpc" {
  source      = "./modules/vpc"
  vpc_cidr           = var.vpc_cidr
  availability_zones = var.availability_zones
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  env         = var.environment
}

# Module Security Groups
module "security_groups" {
  source              = "./modules/security-group"
  environment         = var.environment
  vpc_id              = module.vpc.vpc_id
}

# Module ALB
module "alb" {
  source              = "./modules/alb"
  vpc_id              = module.vpc.vpc_id
  public_subnets      = module.vpc.public_subnets
  target_group_name   =  var.target_group_name
  lb_security_group_id = module.security_groups.alb_security_group_id
  acm_certificate_arn =  module.acm.certificate_arn
}

# Module ACM (Certificate Manager)
module "acm" {
  source              = "./modules/acm"
  domain_name         = var.domain_name
  hosted_zone_id      =  var.hosted_zone_id
}

# Module ECS (Dolibarr)
module "ecs_dolibarr" {
  source               = "./modules/ECS"
  environment          = var.environment
  dolibarr_image       = var.dolibarr_image
  db_host              = module.rds.db_host
  db_port              = module.rds.db_port
  db_user              = var.db_username
  db_name              = var.db_name
  db_password_arn      = module.secrets.db_password_arn
  admin_password_arn   = module.secrets.admin_password_arn
  execution_role_arn   = module.iam.ecs_execution_role_arn
  task_role_arn        = module.iam.ecs_task_execution_role_arn
  subnet_ids           = module.vpc.private_subnets
  security_group_ids   = module.security_groups.ecs_tasks_security_group_id
  target_group_arn     = module.alb.target_group_arn
  aws_region           = var.region
}

# Module RDS
module "rds" {
  source                = "./modules/rds"
  environment           = var.environment
  mysql_version         = var.mysql_version
  instance_class        = var.instance_class
  allocated_storage     = var.allocated_storage
  max_allocated_storage = var.max_allocated_storage
  db_name               = var.db_name
  username              = var.db_username
  security_group_ids    = module.security_groups.rds_security_group_id
  db_password           =  var.db_password
  subnet_ids            = module.vpc.private_subnets
}

# Module Secrets Manager
module "secrets" {
  source                 = "./modules/secret-manager"
  environment            = var.environment
  db_password            = var.db_password
  dolibarr_admin_password = var.dolibarr_admin_password
}

# Module IAM
module "iam" {
  source          = "./modules/iam"
   environment = var.environment
   s3_bucket_name = var.s3_bucket_name
   secrets_arn    = module.secrets.admin_password_arn

}

# Outputs
output "vpc_id" {
  value = module.vpc.vpc_id
}

#output "alb_dns_name" {
#  value = module.alb.dns_name
#}

output "rds_endpoint" {
  value = module.rds.db_endpoint
}
