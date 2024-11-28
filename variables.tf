variable "region" {
  description = "AWS region for the infrastructure"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment (e.g., dev, prod)"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "allowed_ports" {
  description = "List of allowed ports for security groups"
  type        = list(number)
  default     = [80, 443]
}

variable "allowed_ip_ranges" {
  description = "List of allowed IP ranges for security groups"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "domain_name" {
  description = "Domain name for ACM"
  type        = string
}

variable "acm_validation_method" {
  description = "Validation method for ACM (DNS or EMAIL)"
  type        = string
  default     = "DNS"
}

variable "dolibarr_image" {
  description = "Docker image for Dolibarr"
  type        = string
  default     = "tuxgasy/dolibarr:latest"
}

variable "mysql_version" {
  description = "MySQL version for RDS"
  type        = string
  default     = "8.0"
}

variable "instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "Initial allocated storage for RDS"
  type        = number
  default     = 20
}

variable "max_allocated_storage" {
  description = "Maximum allocated storage for RDS"
  type        = number
  default     = 100
}

variable "db_name" {
  description = "Database name for RDS"
  type        = string
  default     = "dolibarr"
}

variable "db_username" {
  description = "Username for RDS database"
  type        = string
  default     = "dolibarr"
}

variable "db_password" {
  description = "Password for RDS database"
  type        = string
}

variable "dolibarr_admin_password" {
  description = "Admin password for Dolibarr"
  type        = string
}

variable "target_group_name" {
  description = "Nom du groupe cible"
  type        = string
}


variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}

variable "hosted_zone_id" {
  description = "Hosted zone id"
  type = string
}

variable "s3_bucket_name" {
  type = string
}
