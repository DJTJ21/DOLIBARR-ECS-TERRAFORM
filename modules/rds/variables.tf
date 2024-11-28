variable "environment" {
  description = "Environment (e.g., dev, prod)"
  type        = string
}

variable "mysql_version" {
  description = "MySQL engine version"
  type        = string
  default     = "8.0"
}

variable "instance_class" {
  description = "Instance class for RDS"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "Initial storage allocated (in GB)"
  type        = number
  default     = 20
}

variable "max_allocated_storage" {
  description = "Maximum storage for RDS"
  type        = number
  default     = 100
}

variable "storage_type" {
  description = "Storage type (e.g., gp2, io1)"
  type        = string
  default     = "gp2"
}

variable "multi_az" {
  description = "Enable multi-AZ deployment"
  type        = bool
  default     = false
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "username" {
  description = "Database master username"
  type        = string
}

variable "security_group_ids" {
  description = "Security groups for RDS"
  type        = string
}

variable "subnet_ids" {
  description = "Subnets for RDS"
  type        = list(string)
}

variable "backup_retention_period" {
  description = "Number of days to retain backups"
  type        = number
  default     = 7
}

variable "deletion_protection" {
  description = "Enable deletion protection"
  type        = bool
  default     = false
}

variable "db_password" {
  type = string
}
