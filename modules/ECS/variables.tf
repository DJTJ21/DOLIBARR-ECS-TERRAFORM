variable "environment" {
  description = "Environment (e.g., dev, prod)"
  type        = string
}

variable "dolibarr_image" {
  description = "Docker image for Dolibarr"
  type        = string
}

variable "db_host" {
  description = "RDS database host"
  type        = string
}

variable "db_port" {
  description = "RDS database port"
  type        = number
}

variable "db_user" {
  description = "Database username"
  type        = string
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "db_password_arn" {
  description = "Secrets Manager ARN for the database password"
  type        = string
}

variable "admin_password_arn" {
  description = "Secrets Manager ARN for the admin password"
  type        = string
}

variable "cpu" {
  description = "Task CPU"
  type        = string
  default     = "256" # 0.25 vCPU
}

variable "memory" {
  description = "Task memory"
  type        = string
  default     = "512" # 0.5 GB
}

variable "execution_role_arn" {
  description = "IAM role ARN for task execution"
  type        = string
}

variable "task_role_arn" {
  description = "IAM role ARN for task"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnets for the ECS tasks"
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of security groups for the ECS tasks"
  type        = string
}

variable "target_group_arn" {
  description = "Target group ARN for the ALB"
  type        = string
}

variable "desired_count" {
  description = "Desired number of task instances"
  type        = number
  default     = 1
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}
